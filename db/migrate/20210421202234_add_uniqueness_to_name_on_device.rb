class AddUniquenessToNameOnDevice < ActiveRecord::Migration[6.1]
  def change
    add_index :devices, :name, unique: true
  end
end
