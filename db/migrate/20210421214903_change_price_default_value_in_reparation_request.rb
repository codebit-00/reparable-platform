class ChangePriceDefaultValueInReparationRequest < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reparation_requests, :price, from: nil, to: 0.0
  end
end
