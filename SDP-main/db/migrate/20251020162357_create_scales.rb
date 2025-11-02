class CreateScales < ActiveRecord::Migration[8.0]
  def change
    create_table :scales do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
