class CreateAnimalFiles < ActiveRecord::Migration
  def change
    create_table :animal_files do |t|
      t.references :animal, index: true
      t.string :file_type, limit: 5
      t.string :path

      t.timestamps
    end
  end
end
