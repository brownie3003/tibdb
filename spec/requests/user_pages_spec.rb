require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.first_name) }
		it { should have_content(user.department)}
	end
	
	describe "signup page" do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "signup" do

		before { visit signup_path }

		let(:submit) { "Create my account" }

		describe "with invalid information" do
			## No input of any user field
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "First name",				with: "Example"
				fill_in "Last name",				with: "User"
				fill_in "Email",					with: "user@example.gsi.gov.uk"
				select	"Ministry of Justice",		from: "Current Department"
				fill_in "Role",						with: "Technology in Business Fast Streamer"
				fill_in "Password",					with: "foobar"
				fill_in "Confirmation",				with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end