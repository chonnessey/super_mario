class AddUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :admin, :boolean, default: false
    end
  end
end
