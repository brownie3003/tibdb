require 'spec_helper'

describe "DepartmentPages" do
	subject { page }

	describe "add department page" do
		before { visit add_department_path }

		it { should have_content("Add Department") }
		it { should have_title(full_title('Add Department')) }
	end
end
