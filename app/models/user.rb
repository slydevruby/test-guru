# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :passages
  has_many :tests, through: :passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  def passage(test)
    passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(lev)
    tests.where(level: lev)
  end
end
