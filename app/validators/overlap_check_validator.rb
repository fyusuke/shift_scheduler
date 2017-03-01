class OverlapCheckValidator < ActiveModel::Validator
    
  def validate(record)
    sd = record.start_datetime
    ed = record.end_datetime
    shifts = Shift.where("worker_id=?", record.worker_id).where.not(id: record.id)
    if shifts.present?
      shifts.each do |sft|
        if ( sd < sft.start_datetime && ed < sft.start_datetime ) || ( sd > sft.end_datetime && ed > sft.end_datetime )
          true
        else
          record.errors[:overlap_check] << '他のバイトと時間帯が被ってます。'
        end
      end
    end
  end
end