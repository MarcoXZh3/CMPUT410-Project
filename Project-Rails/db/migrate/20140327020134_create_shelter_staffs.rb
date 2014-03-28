class CreateShelterStaffs < ActiveRecord::Migration
  def change
    create_table :shelter_staffs do |t|
      t.references :user, index: true
      t.references :people, index: true
      t.string :staff_type, limit: 11
      t.references :shelter, index: true
      t.date :start_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
