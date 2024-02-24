class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('join results on tests.id = results.test_id join users on results.user_id = users.id')
        .where(tests: { level: level }).where(users: { name: name })
  end
end
