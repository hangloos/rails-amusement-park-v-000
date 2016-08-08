class CreateUsers < ActiveRecord::Migration
  
  def change
    create_table :users do |f|
      f.string :name
      f.string :password_digest
      f.integer :nausea
      f.integer :happiness
      f.integer :tickets
      f.integer :height
      f.boolean :admin, default: false
    end
  end
end
