require "rails_helper"

RSpec.describe AddcustomersController, :type => :controller do
  describe "test web requests" do
 #   let(:user) { FactoryBot.create(:user) }
  #  before { sign_in(user) }
#
 #   let(:valid_attributes) {
  #    { :name => "Test name", :lastname => "This is a test lastname", :homeaddress => "This is a test homeaddress", :dateofbirth => "This is a test dateofbirth" }
   # }
    #let(:valid_session) { {} }

       

    context "GET #edit" do
      let(:addcustomer) { Addcustomer.create!(valid_attributes) }
      it "returns a success response" do
       # get :edit, params: { id: addcustomer.id }
        expect(response).to be_successful
      end
    end

    context "GET #show" do
    let!(:project) { Addcustomer.create(name: "John", lastname: "Doe", homeaddress: "123 Main St", dateofbirth: "01/01/1990") }
    it "returns a success response" do
    expect(response).to have_http_status(:ok)
       end
      end


    context "GET #create" do
            # This should return the minimal set of attributes required to create a valid
            # PROJECT. As you add validations to project, be sure to adjust the attributes here as well.
            let(:valid_attributes) {
      {name: "John", lastname: "Doe", homeaddress: "123 Main St", dateofbirth: "01/01/1990" }
    }
            let(:valid_session) { {} }
            describe "GET #create" do
                it "returns a success response" do
                  Addcustomer.create! valid_attributes
                    get :index, params: {}, session: valid_session
                    expect(response).to have_http_status(:ok)
                end
            end
        end

  end
end



#context "GET #create" do             # This should return the minimal set of attributes required to create a valid             # PROJECT. As you add validations to project, be sure to adjust the attributes here as well.             
#let(:valid_attributes) {{ :title => "Test title!", :description => "This is a test description" }}   
#let(:valid_session) { {} }               
#it "returns a success response" do                 
 # Project.create! valid_attributes                 
 # get :index, params: {}, session: valid_session                 
 # expect(response).to have_http_status(:ok)              
#end           
#end


