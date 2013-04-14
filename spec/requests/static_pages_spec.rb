require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "TiB Assignment DB App |"}

	describe "Home page" do

		it "should have the content 'TiB Assignment Database'" do
			visit root_path
			expect(page).to have_content("TiB Assignment Database")
		end
	end

	describe "Help page" do

		it "should have content 'Help'" do
			visit help_path
			expect(page).to have_content('Help')
		end
	end

	describe "About page" do

		it "should have content 'About Us'" do
			visit about_path
			expect(page).to have_content('About Us')
		end
	end

	describe "Assignment page" do

		it "should have content 'Assignments'" do
			visit assignments_path
			expect(page).to have_content("Assignments Listing")
		end
	end
end
