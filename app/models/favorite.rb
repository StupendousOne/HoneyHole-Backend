class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :fishing_spot
end
