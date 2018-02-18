class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :score
      t.integer :putts
      t.integer :user_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
