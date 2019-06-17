class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|

      t.string :name
      t.string :surname
      t.string :father_name
      t.date :date_of_birth
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end