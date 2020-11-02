class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.date       :workday, null: false
      t.time       :start,   null: false
      t.time       :ending,  null: false
      t.references :user,                 foreign_key: true
      t.references :store,                foreign_key: true
      t.timestamps
    end
  end
end
