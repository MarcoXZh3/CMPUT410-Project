class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :user_id, limit: 20
      t.string :user_type, limit: 11
      t.string :name, limit: 50
      t.string :gender, limit: 6
      t.integer :age
      t.string :phone, limit: 15
      t.string :e_mail
      t.string :address, limit: 100
      t.string :city, limit: 20
      t.string :province, limit: 15
      t.string :postal_code, limit: 6
      t.string :education, limit: 20
      t.string :occupation, limit: 20
      t.decimal :income, precision: 12, scale: 2
      t.text :special_skills

      t.timestamps
    end
  end
end
