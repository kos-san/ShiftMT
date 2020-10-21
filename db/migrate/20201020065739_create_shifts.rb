class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date       :month_id, null: false 
      t.date       :day_id,   null: false
      t.datetime   :start
      t.datetime   :ending
      t.text       :text
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
