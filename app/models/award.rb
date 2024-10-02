class Award < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
