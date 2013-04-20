require 'spec_helper'

describe Department do
	before { @department = Department.new(full_name: "Ministry of Justice", abbreviation: "MoJ") }

	subject { @department }

	it { should respond_to (:full_name) }
	it { should respond_to (:abbreviation) }

	it { should be_valid }

	describe "when full_name is blank" do
		before { @department.full_name = "" }
		it { should_not be_valid }
	end

	describe "when full_name is too short (i.e. they've entered abbreviation)" do
		before { @department.full_name = "a" * 5 }
		it { should_not be_valid }
	end
end