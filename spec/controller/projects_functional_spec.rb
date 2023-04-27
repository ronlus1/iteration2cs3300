require "rails_helper"

RSpec.describe AddcustomersController, :type => :controller do
  describe "test web requests" do
    let(:user) { FactoryBot.create(:user) }
    before { sign_in(user) }

    let(:valid_attributes) {
      { :name => "Test name", :lastname => "This is a test lastname", :homeaddress => "This is a test homeaddress", :dateofbirth => "This is a test dateofbirth" }
    }
    let(:valid_session) { {} }

    context "GET #index" do
      it "returns a success response" do
        Addcustomer.create! valid_attributes
        get :index
        expect(response).to be_successful
      end
    end

    context "GET #show" do
      let(:addcustomer) { Addcustomer.create!(valid_attributes) }
      it "returns a success response" do
        get :show, params: { id: addcustomer.id }
        expect(response).to be_successful
      end
    end

    context "GET #edit" do
      let(:addcustomer) { Addcustomer.create!(valid_attributes) }
      it "returns a success response" do
        get :edit, params: { id: addcustomer.id }
        expect(response).to be_successful
      end
    end

    context "GET #destroy" do
      let!(:addcustomer) { Addcustomer.create!(valid_attributes) }
      it "returns a success response" do
        delete :destroy, params: { id: addcustomer.id }
        expect(response).to redirect_to(addcustomers_url)
      end
    end

    describe "GET #create" do
      it "returns a success response" do
        post :create, params: { addcustomer: valid_attributes }
        expect(response).to redirect_to(addcustomer_url(Addcustomer.last))
      end
    end
  end
end
