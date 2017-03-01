class Work < ApplicationRecord

  has_many :users, through:   :workers
  has_many :workers, dependent:   :destroy
  has_many :shifts, through: :workers, dependent:   :destroy
  has_one :indivisual_check, dependent:   :destroy
  has_one :overall_check, dependent:   :destroy
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :phone,  presence: true, length: { minimum: 9, maximum: 11 },
                    uniqueness: true
end

