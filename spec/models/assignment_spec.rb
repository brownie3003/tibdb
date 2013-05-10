require 'spec_helper'

describe Assignment do

	let(:department) { FactoryGirl.create(:department) }
	let(:user)	{ FactoryGirl.create(:user, department: department)}
	before do
		@assignment = department.assignments.build(title: "Example of Job Role", description: "Example of the description of a role", band: "Band A", start_date: 27/05/2013, length: "6 months", user_id: 1)
	end

	subject { @assignment }

	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:band) }
	it { should respond_to(:start_date) }
	it { should respond_to(:length) }

	it { should respond_to(:department_id) }
	its(:department_id) { should eql(user.department_id)}

	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eql(user) }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @assignment.user_id = nil }
		it { should_not be_valid }
	end

	describe "when department_id is not present" do
		before { @assignment.department_id = nil }
		it { should_not be_valid }
	end

	describe "when title is not present" do
		before { @assignment.title = nil }
		it { should_not be_valid }
	end
end
