class Shift < ApplicationRecord
  include ActiveModel::Validations
  
  belongs_to :worker
  validates :worker_id, presence: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :rest_sec, presence: true
  validates_with StartEndCheckValidator,
    if: Proc.new { |sft| sft.start_datetime.present? and sft.end_datetime.present? }
  validates_with OverlapCheckValidator,
    if: Proc.new { |sft| sft.start_datetime.present? and sft.end_datetime.present? }
end
