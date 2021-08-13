require 'rails_helper'

describe Dog, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_inclusion_of(:breed).in_array(Dog::BREEDS) }

    it { should validate_presence_of :price }
    it { should validate_numericality_of(:price).is_greater_than(0) }

    it { should validate_presence_of :description }
    it { should validate_length_of(:description).is_at_least(25) }

    describe "uniqueness" do
      subject { build(:dog) }
      it { should validate_uniqueness_of(:name).case_insensitive }
    end


    it { should belong_to :user }
  end

  describe '#short_description' do
    it 'returns a short description for a dog' do
      user = build(:user)
      dog = build(:dog,
              user: user,
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a pretium nisl, ac blandit quam. Vestibulum commodo risus ac massa semper elementum. Proin et urna sit amet magna aliquam aliquet vitae et risus. Proin congue odio eros, et eleifend mauris ullamcorper nec. Nullam ut mauris nec augue molestie gravida id quis magna. Pellentesque et congue ex, quis rutrum purus. Ut at nunc viverra, rhoncus leo ut, iaculis nisl. Suspendisse urna nunc, viverra rhoncus velit vestibulum, ultricies volutpat velit. Suspendisse hendrerit velit sit amet massa luctus, nec finibus ipsum placerat."
            )

      expect(dog.short_description).to eq "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a pretium nisl, ac..."
    end
  end
end