require 'rails_helper'

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

  it "creates a User and redirects to the User's edit page" do
    get "/users/new"
    expect(response).to render_template(:new)

    post "/users", { :user => { :phone => "4123423452", :password => "1234qwer" } }

    expect(response).to redirect_to(edit_user_path(User.last))
    follow_redirect!
    expect(response).to render_template(:edit)

    fields = {
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
    put "/users/#{User.last.id}", { :user => fields }
    expect(response).to redirect_to(user_path(User.last))
    follow_redirect!
    expect(response).to render_template(:show)
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
