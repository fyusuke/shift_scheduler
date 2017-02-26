class Shift < ApplicationRecord
  belongs_to :worker
  validates :worker_id, presence: true
  validates :ymd, presence: true
  validates :time, presence: true
  validates_uniqueness_of :worker_id, :scope => [:ymd, :time]
end
