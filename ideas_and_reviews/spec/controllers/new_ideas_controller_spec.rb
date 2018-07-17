require "rails_helper"

RSpec.describe NewIdeasController, type: :controller do
  describe "#new" do
    context "with no user signed in" do
      it "redirects to the sign in page" do
        get :new

        expect(response).to redirect_to new_user_path
      end
    end
    context "with user signed in" do
            before do
                session[:user_id] = current_user.id
            end
            it "renders the new template" do
                
                get :new
                expect(response).to render_template(:new)
            end
        
            it "sets an instance variable with a new idea" do
                    get :new
                    expect(assigns(:idea)).to be_a_new(Idea)
            end
        end
    end
    describe "#create" do

  end
end
