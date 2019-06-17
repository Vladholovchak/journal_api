class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|

      t.string :group_name
      t.date :start_stud_date
      t.string :leader

      t.timestamps
    end
  end
end
