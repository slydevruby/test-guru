# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "The question about #{@test.title} from TestGuru",
      public: false,
      files:
        {
          'question.md' => { content: gist_content }
        }
    }
  end

  def gist_content
    "# #{@question.body}\n" + @question.answers.pluck(:body).map { |b| " * #{b}\n" }.join
  end
end
