class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|

      t.string :name, null: true, default: ''
      t.string :surname, null: true, default: ''
      t.string :father_name, null: true, default: ''
      t.date :date_of_birth, null: true, default: '2019-04-13 17:48:19'
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end