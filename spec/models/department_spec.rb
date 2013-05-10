require 'spec_helper'

describe Department do
	before { @department = Department.new(full_name: "Ministry of Justice", abbreviation: "MoJ") }

	subject { @department }

	it { should respond_to (:full_name) }
	it { should respond_to (:abbreviation) }
	it { should respond_to (:users) }
	it { should respond_to (:assignments) }

	it { should be_valid }

	describe "when full_name is blank" do
		before { @department.full_name = "" }
		it { should_not be_valid }
	end

	describe "when full_name is too short (i.e. they've entered abbreviation)" do
		before { @department.full_name = "a" * 5 }
		it { should_not be_valid }
	end

	describe "assignment associations" do

		before { @department.save }
		let!(:older_assignment) do
			FactoryGirl.create(:assignment, user_id: 1, department: @department, start_date: Time.now + 1.month)
		end
		let!(:newer_assignment) do
			FactoryGirl.create(:assignment, user_id: 1, department: @department, start_date: Time.now + 1.day)
		end

		it "should have the right assignments in the right order" do
			expect(@department.assignments.to_a).to eql([newer_assignment, older_assignment])
		end
	end
end