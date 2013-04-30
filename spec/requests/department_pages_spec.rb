require 'spec_helper'

describe "DepartmentPages" do
	subject { page }

	describe "add department page" do
		before { visit add_department_path }

		let(:submit) { "Add department" }

		it { should have_content("Add Department") }
		it { should have_title(full_title('Add Department')) }

		describe "with invalid information" do
			it "should not create a department" do
				expect { click_button submit }.not_to change(Department, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Full Department Title",			with: "Department for Education"
				fill_in "Department Abbreviation",			with: "DfE"
			end

			it "should create a department" do
				expect { click_button submit }.to change(Department, :count).by(1)
			end
		end
	end
end
