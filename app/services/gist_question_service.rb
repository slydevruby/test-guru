# frozen_string_literal: true

class GistQuestionService
  def initialize(question)
    @question = question
    @test_title = @question.test.title
    @client = setup_http_client
  end

  def call
    result = @client.create_gist(gist_params)
    [result.html_url, @client.last_response.present?]
  rescue StandardError
    ['', false]
  end

  private

  def gist_content
    "# #{@question.body}\n" + @question.answers.pluck(:body).map { |b| " * #{b}\n" }.join
  end

  def gist_params
    {
      description: "The question from #{@test_title} at TestGuru",
      public: false,
      files:
      {
        'question.md' => { content: gist_content }
      }
    }
  end

  def setup_http_client
    Octokit::Client.new(access_token: ENV.fetch('GIT_TOKEN', nil))
  end
end
