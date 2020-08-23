class AddSpecialrequestToUserItems < ActiveRecord::Migration[5.2]
  def change
    add_column :user_items, :time, :time
    add_column :user_items, :, :text
  end
end
