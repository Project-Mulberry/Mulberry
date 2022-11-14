require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do



  it("should log a user in") do
    session_hash= {}
    allow(helper).to receive(:session).and_return session_hash
    user = double()
    allow(user).to receive(:id).and_return(52)
    helper.log_in(user)
    expect(session_hash[:user_id]).to eq(52)
  end

  describe("current user, current_user? and logged_in?") do

    it("when a user is logged in" ) do
      session_hash= {user_id: 20}
      #mock session variable in sessions helper
      allow(helper).to receive(:session).and_return session_hash
      sample_user = double()
      # Mock User class to return our fake user when it receives a call
      allow(User).to receive(:find_by).and_return(sample_user)

      user = helper.current_user
      user = helper.current_user

      expect(user).to be(sample_user)
      expect(User).to have_received(:find_by).with ({uid: 20})
      expect(helper.logged_in?).to be(true)
      expect(helper.current_user?(sample_user)).to be(true)
      expect(helper.current_user?(double())).to be(false)

    end
    it("when user is not logged in") do
      session_hash= {}
      allow(helper).to receive(:session).and_return session_hash
      allow(User).to receive(:find_by).and_return({})
      user = helper.current_user

      expect(user).to be(nil)
      expect(User).not_to have_received(:find_by)
      expect(helper.logged_in?).to be(false)
      expect(helper.current_user?(double())).to be(false)
    end

  end
  it("should log the user out when asked") do
    session_hash= {user_id: 32}
    allow(helper).to receive(:session).and_return session_hash
    helper.log_out
    expect(session_hash).to eq({})
    expect(helper.current_user).to eq(nil)
  end
  #
  # it("should redirect_back_or to a url if present") do
  #   session_hash= {forwarding_url: "/users"}
  #   allow(helper).to receive(:session).and_return session_hash
  #   helper.stub(:redirect_to)
  #
  #   helper.redirect_back_or("/default")
  #   expect(helper).to have_received(:redirect_to).with("/users")
  #   expect(session_hash).to eq({})
  #
  #   helper.redirect_back_or("/default")
  #   expect(helper).to have_received(:redirect_to).with("/default")
  # end

  it("should store the location") do
    session_hash= {}
    req= double()
    allow(req).to receive(:get?).and_return true
    allow(req).to receive(:original_url).and_return "ORIGINAL_URL"
    allow(helper).to receive(:session).and_return session_hash
    allow(helper).to receive(:request).and_return(req)
    helper.store_location
    expect(session_hash[:forwarding_url]).to eq("ORIGINAL_URL")
  end
end
