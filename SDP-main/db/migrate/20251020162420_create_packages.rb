class CreatePackages < ActiveRecord::Migration[8.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :credits
      t.decimal :price

      t.timestamps
    end
  end
end
