class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :right, -> { where(correct: true) }
end
