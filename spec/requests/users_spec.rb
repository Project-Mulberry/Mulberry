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
  end

  describe '#update' do
    context 'career field is missing in the form attributes' do
      user = User.last ||  User.create(phone: "4123423452", password: "1234qwer")
      # let's intentionally remove career field,
      # which is required to be present
      # and checked by User model validations
      fields = EXAMPLE_INPUT_FIELDS.clone
      fields.delete(:career)

      it 'should not update the user  & display error message' do
        get "/users/#{user.id}/edit"

        # this request should not update our user,
        # since required field was not provided
        put "/users/#{user.id}", { :user => fields }

        expect(response).to render_template(:edit)

        # check that error message was rendered
        expect(response.body).to match("can&#39;t be blank")
      end
    end

    context 'all required user fields are present' do
      user = User.last ||  User.create(phone: "4123423452", password: "1234qwer")

      it 'should update the user successfully' do
        get "/users/#{user.id}/edit"
        put "/users/#{user.id}", { :user => EXAMPLE_INPUT_FIELDS }
        expect(response).to redirect_to(matchmake_index_path)
        expect(user.reload.name).to eq(EXAMPLE_INPUT_FIELDS[:name])
        expect(user.reload.gender).to eq(EXAMPLE_INPUT_FIELDS[:gender])
      end
    end
  end
end
