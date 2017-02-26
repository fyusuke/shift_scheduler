class Worker < ApplicationRecord
  belongs_to :users
  belongs_to :works
  has_many :shifts, dependent:   :destroy

  validates :user_id, presence: true
  validates :work_id, presence: true
  validates_uniqueness_of :user_id, :scope => [:work_id]
    
end
