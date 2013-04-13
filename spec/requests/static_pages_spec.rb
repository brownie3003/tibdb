require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "TiB Assignment DB App |"}

	describe "Home page" do

		it "should have the content 'TiB Assignment Database'" do
			visit '/static_pages/home'
			expect(page).to have_content("TiB Assignment Database")
		end

		it "should have the title 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title("#{base_title} Home")
		end
	end

	describe "Help page" do

		it "should have content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
	end

	describe "About page" do

		it "should have content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end
	end

	describe "Assignment page" do

		it "should have content 'Assignments'" do
			visit '/static_pages/assignments'
			expect(page).to have_content("Assignments Listing")
		end
	end
end
