# frozen_string_literal: true

class GistQuestionService
  def initialize(question)
    @question = question
    @test_title = @question.test.title
    @client = setup_http_client
  end

  def call
    @result = @client.create_gist(gist_params)
    return_struct
  rescue StandardError
    return_struct
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

  def return_struct
    Struct.new(:success?, :gist_url).new.tap do |st|
      st['success?'] = @client.last_response.present?
      st.gist_url = @result.html_url
    end
  end

  def setup_http_client
    Octokit::Client.new(access_token: Rails.application.credentials.git_token)
  end
end
