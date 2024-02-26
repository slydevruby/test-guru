class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def tests_by_level(level)
    Test.joins('join results on tests.id = results.test_id')
        .where(tests: { level: level })
        .where(results: { user_id: id })
  end
end
