require 'rails_helper'

RSpec.describe Student, type: :model do
  # Association test
  # ensure an student record belongs to a single group record
  it { should belong_to(:group) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }

end
