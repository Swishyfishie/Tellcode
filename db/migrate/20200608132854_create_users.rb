class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :about_me
      t.string :date_started
      t.string :password_digest
      
      t.timestamps
    end
  end
end