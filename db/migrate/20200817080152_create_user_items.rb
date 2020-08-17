class CreateUserItems < ActiveRecord::Migration[5.2]
  def change
    create_table :user_items do |t|
      t.integer :user_id
      t.integer :dealer_services_id 
      t.timestamps
    end
  end
end
