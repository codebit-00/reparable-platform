class CreateJoinTableDevicesStores < ActiveRecord::Migration[6.1]
  def change
    create_join_table :devices, :stores do |t|
      # t.index [:device_id, :store_id]
      # t.index [:store_id, :device_id]
    end
  end
end
