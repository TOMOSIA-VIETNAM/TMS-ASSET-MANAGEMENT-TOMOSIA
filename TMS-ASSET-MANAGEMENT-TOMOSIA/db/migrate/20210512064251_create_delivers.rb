class CreateDelivers < ActiveRecord::Migration[6.1]
  def change
    create_table :delivers do |t|
      t.string :type
      t.integer :status
      t.datetime :start_date
      t.datetime :end_date
      t.text :reason
      t.integer :request_id
      t.integer :item_id

      t.timestamps
    end
  end
end
