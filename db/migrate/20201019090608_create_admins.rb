class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.references :member, foreign_key: true
      t.references :store,  foreign_key: true
      t.timestamps
    end
  end
end
