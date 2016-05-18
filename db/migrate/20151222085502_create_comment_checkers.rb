class CreateCommentCheckers < ActiveRecord::Migration
  def change
    create_table :comment_checkers do |t|
      t.string :word, null: false

      t.timestamps null: false
    end
  end
end
