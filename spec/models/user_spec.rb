require 'rails_helper'

describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  describe '#full_name' do
    it 'returns the full_name for a user' do
      # user = User.create(first_name: "Chipper", last_name: "Roe")
      user = build(:user, first_name: "Chipper", last_name: "Roe")

      expect(user.full_name).to eq "Chipper Roe"
    end
  end
end