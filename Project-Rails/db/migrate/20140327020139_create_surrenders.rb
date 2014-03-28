class CreateSurrenders < ActiveRecord::Migration
  def change
    create_table :surrenders do |t|
      t.date :apply_date
      t.references :people, index: true
      t.references :animal, index: true
      t.date :surrender_date
      t.boolean :accepted
      t.text :reason

      t.timestamps
    end
  end
end
