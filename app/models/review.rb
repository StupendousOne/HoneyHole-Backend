class Review < ApplicationRecord
  belongs_to :fishing_spot
  belongs_to :user
end
