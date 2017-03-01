class StartEndCheckValidator < ActiveModel::Validator
    
  def validate(record)

    if record.start_datetime < record.end_datetime 
        true
    else
        record.errors[:start_end_check] << 'バイト開始時間が終了時間よりも後です。'
    end
  end
  
end