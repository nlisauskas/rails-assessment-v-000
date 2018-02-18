class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :slope
      t.integer :rating

      t.timestamps null: false
    end
  end
end
