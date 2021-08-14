require "rails_helper"

describe DogsController, type: :controller do
  before do
    sign_in create(:user)
  end

  describe "#index" do
    context "not logged in" do
      it "can't get to index" do
        sign_out :user
        get :index

        expect(response).to redirect_to new_user_session_path
      end
    end

    context "logged in" do
      it "can get to index" do
        get :index

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#new" do
    context "not logged in" do
      it "can't get to new page" do
        sign_out :user
        get :new

        expect(response).to redirect_to new_user_session_path
      end
    end

    context "logged in" do
      it "can get to new page" do
        get :new

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#create" do
    context "when dog is valid" do
      it "redirects to #show" do
        # TODO: See to refactor this
        dog = stub_valid_dog

        post :create, params: { dog: attributes_for(:dog) }

        expect(response).to redirect_to(dog)
      end
    end

    context "when dog is invalid" do
      it "renders the 'new' template" do
        # TODO: See to refactor this
        dog = stub_invalid_dog

        post :create, params: { dog: attributes_for(:dog) }

        expect(response).to render_template(:new)
      end
    end
  end

  private

  def stub_valid_dog
    Dog.new.tap do |dog|
      allow(Dog).to receive(:new).and_return dog
      allow(dog).to receive(:save).and_return(true)
    end
  end

  def stub_invalid_dog
    Dog.new.tap do |dog|
      allow(Dog).to receive(:new).and_return dog
      allow(dog).to receive(:save).and_return(false)
    end
  end
end
