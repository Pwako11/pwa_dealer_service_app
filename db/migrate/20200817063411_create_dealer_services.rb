class CreateDealerServices < ActiveRecord::Migration[5.2]
  def change
    create_table :dealer_services do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :time
      t.timestamps null: false
    end
  end
end
