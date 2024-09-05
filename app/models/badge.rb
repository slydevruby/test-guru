class Badge < ApplicationRecord

  belongs_to :rule, optional: true

  has_one_attached :image, dependent: :destroy
end
