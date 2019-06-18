# frozen_string_literal:true
class Group < ApplicationRecord

  has_many :students, dependent: :destroy

  validates_presence_of :group_name, :start_stud_date, :leader

end
