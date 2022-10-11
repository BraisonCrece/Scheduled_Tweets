class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false # we just added 'null: false' to prevent Users from being saved without an email
      t.string :password_digest

      t.timestamps
    end
  end
end
