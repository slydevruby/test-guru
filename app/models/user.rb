class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('join results on tests.id = results.test_id')
        .where(tests: { level: level })
        .where(results: { user_id: id })
  end
end
