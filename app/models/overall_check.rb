class OverallCheck < ApplicationRecord
  belongs_to :work
  validates :work_id, presence: true
end
