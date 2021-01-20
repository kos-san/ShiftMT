class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user,   foreign_key: true
      t.references :store, foreign_key: true
      t.boolean    :admin, default: false
      t.timestamps
    end
  end
end
