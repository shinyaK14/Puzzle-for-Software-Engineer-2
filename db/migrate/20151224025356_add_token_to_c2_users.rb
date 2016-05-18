class AddTokenToC2Users < ActiveRecord::Migration
  def change
    add_column :c2_users, :token, :string
  end
end
