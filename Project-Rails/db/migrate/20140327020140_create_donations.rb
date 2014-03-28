class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.date :apply_date
      t.references :people, index: true
      t.string :donation_type, limit: 7
      t.text :content
      t.references :animal, index: true
      t.date :donation_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
