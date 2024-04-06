# frozen_string_literal: true

class GistQuestionService
  def initialize(question)
    @question = question
    @test_title = @question.test.title
    @client = setup_http_client
  end

  def call
    result = @client.create_gist(gist_params)
    create_struct.new(@client, result)
  rescue StandardError
    create_struct.new(@client, result)
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

  def create_struct
    Struct.new(:client, :result) do
      def success?
        client.last_response.present?
      end

      def gist_url
        result.html_url
      end
    end
  end

  def setup_http_client
    Octokit::Client.new(access_token: ENV.fetch('GIT_TOKEN', nil))
  end
end
