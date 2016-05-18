class CreateMailCheckers < ActiveRecord::Migration
  def change
    create_table :mail_checkers do |t|
      t.string :word, null: false

      t.timestamps null: false
    end
  end
end
