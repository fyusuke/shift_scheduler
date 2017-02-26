class Line < ApplicationRecord
  has_one :user
  validates :line_token, presence: true, uniqueness: true
end
