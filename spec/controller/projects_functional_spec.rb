require "rails_helper"


RSpec.describe AddcustomersController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end


        context "GET #show" do
            let!(:addcustomers) { AddcustomersController.create(firstname: "Test firstname", lastname: "Test lastname", homeaddress: "Test address", birthday: Date.today) }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
            
        end
        context "GET #edit" do
            let!(:addcustomers) { AddcustomersController.create(firstname: "Test firstname", lastname: "Test lastname", homeaddress: "Test address", birthday: Date.today) }
            it "returns a success response" do
                get :edit, params: {id:addcustomers}
                expect(response).to have_http_status(:ok)
            end
        end
    end


end 