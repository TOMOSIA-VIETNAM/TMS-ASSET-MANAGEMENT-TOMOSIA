class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status
      t.string :comment
      t.float :price
      t.text :tag_search
      t.text :detail
      t.integer :category_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
