class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :type_request
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.text :reason
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
