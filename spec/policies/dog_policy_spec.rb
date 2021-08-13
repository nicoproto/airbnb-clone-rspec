require 'rails_helper'

describe DogPolicy do
  subject { described_class.new(user, dog) }

  let(:dog) { Dog.create }

  context 'being a visitor' do
    let(:user) { User.create }

    it { is_expected.to permit_actions(:show, :index, :new, :create) }
    it { is_expected.to forbid_actions(:destroy, :update, :edit) }
  end

  context 'being the owner' do
    # TODO: Update this into FactoryBot
    let(:user) { User.create(
      email: "nico@gmail.com",
      password: "password",
      first_name: "Nico",
      last_name: "Proto"
    ) }
    let(:dog) { Dog.create(user_id: user.id) }

    it { is_expected.to permit_actions(:destroy, :update, :edit) }
  end

  let(:resolved_scope) do
    described_class::Scope.new(user, Dog.all).resolve
  end

  context 'being a visitor' do
    # TODO: Update this into FactoryBot
    let(:user) { User.create(
      email: "nico@gmail.com",
      password: "password",
      first_name: "Nico",
      last_name: "Proto"
    ) }

    context 'accessing a create dog' do
      # TODO: Update this into FactoryBot
      let(:dog) { Dog.create!(
                  user_id: user.id,
                  name: "Tobby",
                  description: "It's a good boy, a really good boy that always takes care of you.",
                  breed: "saint bernard",
                  location: "Carrer de Sant Pau 100",
                  price: 250
                ) }

      it 'includes dog in resolved scope' do
        expect(resolved_scope).to include(dog)
      end

      it { is_expected.to permit_action(:show) }
    end
  end
end
