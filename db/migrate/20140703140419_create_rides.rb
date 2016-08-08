class CreateRides < ActiveRecord::Migration
  
  def change
    create_table :rides do |f|
      f.integer :user_id
      f.integer :attraction_id
    end
  end
end
