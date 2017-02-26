class IndivisualCheck < ApplicationRecord
  belongs_to :works
  validates :work_id, presence: true
end
