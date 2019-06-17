require 'rails_helper'

RSpec.describe Group, type: :model do
  # Association test
  # ensure Group model has a 1:m relationship with the Student model
  it { should have_many(:students).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:leader) }
end
