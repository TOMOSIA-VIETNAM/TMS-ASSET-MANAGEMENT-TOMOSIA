class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role
      t.string :password
      t.string :phone_number
      t.integer :project_id

      t.timestamps
    end
  end
end
