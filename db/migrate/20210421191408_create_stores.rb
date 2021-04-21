class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.integer :priority
      t.string :address

      t.timestamps
    end
  end
end
