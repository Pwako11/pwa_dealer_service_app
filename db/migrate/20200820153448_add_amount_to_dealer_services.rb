class AddAmountToDealerServices < ActiveRecord::Migration[5.2]
  def change
    add_column :dealer_services, :amount, :float
  end
end
