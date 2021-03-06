require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "Not signed in pages" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit root_path }

		it { should_not have_link('Sign out',	href: signout_path) }
		it { should_not have_link('Settings',	href: edit_user_path(user)) }
		it { should have_link('Sign in',		href: signin_path) }
	end

	describe "signin page" do
		before { visit signin_path }

		it { should have_content('Sign in') }
		it { should have_title('Sign in') }

		describe "with invalid information" do
			before { click_button "Sign in" }

			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "Home" }
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { sign_in user }

			it { should have_title(user.first_name) }
			it { should have_link('Profile',		href: user_path(user)) }
			it { should have_link('Settings',		href: edit_user_path(user)) }
			it { should have_link('Sign out',		href: signout_path) }
			it { should_not have_link('Sign in',	href: signin_path) }

			describe "followed by signout" do
				before { click_link "Sign out" }
				it { should have_link('Sign in') }
			end
		end
	end

	describe "authorisation" do

		describe "for non-signed-in users" do
			let(:user) { FactoryGirl.create(:user) }

			describe "when attempting to visit Edit user page" do
				before do
					visit edit_user_path(user)
					fill_in "Email", 	with: user.email
					fill_in "Password",	with: user.Password
					click_button "Sign in"
				end

				describe "after signing in" do

					it "should render the desired protected page" do
						expect(page).to have_title('Edit user')
					end
				end
			end

			describe "in the Users controller" do

				describe "visiting the edit page" do
					before { visit edit_user_path(user) }
					it { should have_title("Sign in") }
				end

				describe "submitting to the update action" do
					before { patch user_path(user) }
					specify { expect(response).to redirect_to signin_path }
				end
			end

			describe "in the Assignments controller"
				let(:department) { FactoryGirl.create(:department) }
				let(:user)	{ FactoryGirl.create(:user, department: department) }
				before do
					@assignment = department.assignments.build(title: "Example of Job Role", description: "Example of the description of a role", band: "Band A", start_date: 27/05/2013, length: "6 months", user_id: 1)
				end
					
				describe "visiting specific assignment page" do
					before { visit assignment_path(assignment.id) }
					it { should have_title("Sign in") }
				end
			end
		end

		describe "as wrong user" do
			let(:user) { FactoryGirl.create(:user) }
			let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@justice.gsi.gov.uk") }
			before { sign_in user }

			describe "visiting Users#edit page" do
				before { visit edit_user_path(wrong_user) }
				it { should_not have_title(full_title('Edit user')) }
			end

			describe "submitting a PATCH request to the Users#update action" do
				before { patch user_path(wrong_user) }
				specify { expect(response).to redirect_to(root_path) }
			end
		end
	end
end