class ChangeNameStartDayEndDayRequest < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :start_date, :start_time
    rename_column :requests, :end_date, :end_time
  end
end
