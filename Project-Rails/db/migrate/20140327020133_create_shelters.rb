class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.integer :shelter_id
      t.string :name, limit: 50
      t.string :shelter_type, limit: 8
      t.string :address, limit: 100
      t.string :city, limit: 20
      t.string :province, limit: 15
      t.string :postal_code, limit: 6
      t.string :phone, limit: 15
      t.string :e_mail
      t.text :open_hour

      t.timestamps
    end
  end
end
