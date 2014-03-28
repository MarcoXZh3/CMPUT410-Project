class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :animal_id, limit: 10
      t.string :name, limit: 50
      t.string :species, limit: 10
      t.string :breed, limit: 50
      t.date :birthday
      t.date :deathday
      t.string :gender, limit: 6
      t.string :size, limit: 10
      t.string :color, limit: 10
      t.boolean :sn
      t.decimal :price, precision: 7, scale: 2
      t.boolean :stage
      t.references :shelter, index: true

      t.timestamps
    end
  end
end
