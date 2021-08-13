class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
