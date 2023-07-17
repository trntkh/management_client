class ChangeDataTypeForShiftTime < ActiveRecord::Migration[6.1]
  def change
    change_column(:requests, :shift_time, :integer)
  end
end
