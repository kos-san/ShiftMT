class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date       :workday, null: false 
      t.time   :start
      t.time   :ending
      t.text       :text
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
