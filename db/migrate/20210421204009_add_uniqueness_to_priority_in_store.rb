class AddUniquenessToPriorityInStore < ActiveRecord::Migration[6.1]
  def change
    add_index :stores, :priority, unique: true 
  end
end
