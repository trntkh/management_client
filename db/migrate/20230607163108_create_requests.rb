class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :admin_id
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :total_days, null: false
      t.float :shift_time
      t.text :reason
      t.string :name, null: false 
      t.integer :status, null: false, default: 0
      t.float :point, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
