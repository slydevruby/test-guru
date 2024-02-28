class Answer < ApplicationRecord
  belongs_to :question

  enum :correct, { wrong:false, right:true }

#  scope :good, -> { where(correct: true) }
end
