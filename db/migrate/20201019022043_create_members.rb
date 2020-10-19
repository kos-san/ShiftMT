class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user,  null: false
      t.references :store, null: false
      t.timestamps
    end
  end
end
