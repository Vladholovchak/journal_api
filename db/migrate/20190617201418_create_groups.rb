class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|

      t.string :group_name, null: true, default: ''
      t.date :start_stud_date, null: true, default: '2019-04-13 17:48:19'
      t.string :leader, null: true, default: ''

      t.timestamps
    end
  end
end
