class AddPriceToReparationRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :reparation_requests, :price, :decimal
  end
end
