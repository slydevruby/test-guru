class User < ApplicationRecord
  def tests(level)
    tests = Test.where(level: level)

    out = []
    tests.each do |test|
      res1 = Result.where(user_id: id)
      next unless res1.size.positive?

      out << test if res1.where(test_id: test.id).size.positive?
    end
    out
  end
end
