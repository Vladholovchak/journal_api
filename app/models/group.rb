class Group < ApplicationRecord

  has_many :students, dependent: :destroy

  validates_presence_of :leader, :group_name

end
