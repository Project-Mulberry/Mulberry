require 'rails_helper'

EXAMPLE_INPUT_FIELDS = {
  education: "undergraduate",
  name: "Jack",
  gender: "male",
  sexuality: "heterosexual",
  birthday: DateTime.new,
  location: "Chicago",
  career: "Driver",
  height: "5.8",
  profile_photo: "www.google.com"
}



RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST /create" do
  #   it "returns http success" do
  #     get "/users/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # it "creates a User and redirects to the User's edit page" do
  #   get "/users/new"
  #   expect(response).to render_template(:new)
  #
  #   # create stub user
  #   post "/users", { :user => { :phone => "4123423452", :password => "1234qwer" } }
  #
  #   # if user was created successfully, it should redirect to extended form
  #   # on the edit action path
  #   expect(response).to redirect_to(edit_user_path(User.last))
  #   follow_redirect!
  #   expect(response).to render_template(:edit)
  #
  #   # let's take sample of correct values for edit form
  #   # and submit them
  #   fields = EXAMPLE_INPUT_FIELDS
  #   put "/users/#{User.last.id}", { :user => fields }
  #
  #   # after correct update browser should redirect to user page
  #   expect(response).to redirect_to(user_path(User.last))
  #   follow_redirect!
  #   expect(response).to render_template(:show)
  # end

  it "should not update profile if career field was blank" do
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users", { :user => { :phone => "4123423452", :password => "1234qwer" } }

    expect(response).to redirect_to(edit_user_path(User.last))
    follow_redirect!
    expect(response).to render_template(:edit)

    # let's intentionally remove career field,
    # which is required to be present
    # and checked by User model validations
    fields = EXAMPLE_INPUT_FIELDS.clone
    fields.delete(:career)

    # this request should not update our user,
    # since required field was not provided
    put "/users/#{User.last.id}", { :user => fields }
    expect(response).to render_template(:edit)

    # check that error message was rendered
    expect(response.body).to match("can&#39;t be blank")
  end




  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/users/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/users/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/users/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/users/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
