class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status
      t.string :comment
      t.float :price
      t.text :tag_search
      t.text :detail
      t.references :category
      t.references :provider
      t.references :user

      t.timestamps
    end
  end
end
