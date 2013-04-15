require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "TiB Assignment DB App |"}
	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content("TiB Assignment Database") }
	end

	describe "Help page" do
		before { visit help_path }

		it { should have_content('Help') }
	end

	describe "About page" do
		before { visit about_path }

		it { should have_content('About Us') }
	end

	describe "Assignments page" do
		before { visit assignments_path }

		it { should have_content("Assignments Listing") }
	end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_content("Contact") }
	end
end
