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

  describe '#create' do
    context 'all valid form attributes are present' do
      it 'creates the user profile successfully' do
        post "/users", { :user => { :phone => "4123423455", :password => "1234qwer" } }
        expect(response).to redirect_to(edit_user_path(User.last))
        follow_redirect!
        expect(response).to render_template(:edit)
      end
    end

    context 'user did not put a password' do
      it 'flash a warning and stay on the same page' do
        post "/users", { :user => { :phone => "4123423455", :password => "" } }
        expect(response).to render_template(:new)
        expect(response.body).to match("can&#39;t be blank")
      end
    end
  end


  describe '#update' do
    context "Without logging in" do
      it "should redirect to login" do
        get "/users/3"
        expect(response).to redirect_to(login_url)
      end
    end

    context "incorrect user accesses the profile" do
       it("should redirect to root") do
        actual_user = User.last ||  User.create(phone: "5123423452", password: "1234qwer")
        new_user = User.create(phone: "2123423452", password: "1234qwer")
        post "/login", user: {phone: actual_user.phone, password: "1234qwer"}
        get "/users/#{new_user.id}/edit"
        expect(response).to redirect_to(root_url)
      end
    end

    context "created account with all info filled" do
      it("should redirect to root") do
        actual_user = User.create(:phone => '1234567890', :password => '123456', :name => 'Marcus', :gender => 'm', :sexuality => 'straight', :birthday => '01-Jan-2000', :location => 'NY', :education => 'Bachelor', :career => 'Student', :height => '6.0', :profile_photo => nil)
        post "/login", user: {phone: actual_user.phone, password: "123456"}
        get "/login"
        expect(response).to redirect_to(root_url)
      end
    end

    context "created account without filling" do
      it("should redirect to root") do
        actual_user = User.create(phone: "5123423477", password: "1234qwer")
        post "/login", user: {phone: actual_user.phone, password: "1234qwer"}
        expect(response).to redirect_to(edit_user_path(actual_user))
      end
    end

    context 'career field is missing in the form attributes' do
      user = User.create(phone: "4123423452", password: "1234qwer")

      # let's intentionally remove career field,
      # which is required to be present
      # and checked by User model validation
      fields = EXAMPLE_INPUT_FIELDS.clone
      fields['interest_attributes']= {interest1: "Climbing", interest2: "Biking", interest3: "Jogging"}
      fields['prompt_attributes']= {interest1: "Poetry", interest2: "Chocolate", interest3: "Cake"}
      fields.delete(:career)

      it 'should not update the user  & display error message' do
        get "/login"
        post "/login", user: {phone: "4123423452", password: "1234qwe"}
        expect(response).to render_template(:new)

        post "/login", user: {phone: "4123423452", password: "1234qwer"}
        expect(response).to redirect_to(edit_user_path(User.last))

        get edit_user_path(User.last)

        # this request should not update our user,
        # since required field was not provided
        put user_path(User.last), { :user => fields }

        expect(response).to render_template(:edit)

        # check that error message was rendered
        expect(response.body).to match("can&#39;t be blank")
      end
    end

    context 'all required user fields are present' do
      user = User.create(phone: "4123423452", password: "1234qwer")

      fields = EXAMPLE_INPUT_FIELDS.clone
      fields['interest_attributes']= {interest1: "Climbing", interest2: "Biking", interest3: "Jogging"}
      fields['prompt_attributes']= {interest1: "Poetry", interest2: "Chocolate", interest3: "Cake"}
      it 'should update the user successfully' do
        post "/login", { :user => { :phone => "4123423452", :password => "1234qwer" } }
        get edit_user_path(User.last)
        put user_path(User.last), { :user => fields }
        expect(response).to redirect_to(root_path)
        expect(User.last.name).to eq(EXAMPLE_INPUT_FIELDS[:name])
        expect(User.last.gender).to eq(EXAMPLE_INPUT_FIELDS[:gender])
        #running a second request to ensure fields are updated
        put user_path(User.last), { :user => fields }
        expect(User.last.interest).to_not be(nil)
        delete "/logout"
      end
    end

  end
end
