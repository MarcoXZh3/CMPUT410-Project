class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :people, index: true
      t.references :animal, index: true
      t.date :received_date

      t.timestamps
    end
  end
end
