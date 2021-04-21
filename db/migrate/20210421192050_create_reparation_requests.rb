class CreateReparationRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :reparation_requests do |t|
      t.references :store, null: false, foreign_key: true
      t.integer :device
      t.string :status, default: 'pending'
      t.date :purchase_installation_date
      t.text :issue_description
      t.string :model_number
      t.string :requester_zip_code
      t.string :requester_address
      t.string :requester_first_name
      t.string :requester_last_name
      t.string :requester_email
      t.string :requester_telephone
      t.string :requester_country
      t.string :requester_state
      t.string :requester_city

      t.timestamps
    end
  end
end
