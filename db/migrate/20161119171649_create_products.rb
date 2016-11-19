class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
