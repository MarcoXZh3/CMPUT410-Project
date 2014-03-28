class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.date :apply_date
      t.references :people, index: true
      t.references :animal, index: true
      t.date :adoption_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
