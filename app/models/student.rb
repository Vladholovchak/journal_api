# frozen_string_literal:true
class Student < ApplicationRecord

  belongs_to :group

  validates_presence_of :name, :surname, :father_name, :date_of_birth, :group
end
