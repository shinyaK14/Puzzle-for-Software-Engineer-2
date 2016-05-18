class CreateC2Users < ActiveRecord::Migration
  def change
    create_table :c2_users do |t|
      t.string :username, null:false, default: ""
      t.string :email, null: false, default: ""
      t.string :password
      t.text :comment

      t.timestamps null: false
    end
  end
end
