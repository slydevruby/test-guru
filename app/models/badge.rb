class Badge < ApplicationRecord

  has_one :rule

  has_one_attached :image, dependent: :destroy
end
