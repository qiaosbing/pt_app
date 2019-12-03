class LowEnforcementParameter < ActiveRecord::Base

  #根据时间查询数据
  scope :s_by_time,->(start_time,end_time){
    where(:data_time => start_time .. end_time)
  }

end
