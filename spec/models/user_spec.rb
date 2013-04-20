require 'spec_helper'

describe User do
	
	before { @user = User.new(first_name: "Example", last_name: "User", email: "user@department.gsi.gov.uk", department: "Ministry of Justice", role: "TiB", password: "test123", password_confirmation: "test123")}

	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:department) }
	it { should respond_to(:role) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	# This doesn't actually test fields individually. It should still
	# not be valid when only 1 - 4 fields are filled in, but the test is so simple
	# I'm not repeating it for 5 fields, probably can refactor this.
	describe "when any sign up field is blank" do
		before { @user.first_name = " " && @user.last_name = " " && @user.email = " " && @user.department = " " && @user.role = " " }
		it { should_not be_valid }
	end

	describe "when first_name is too long" do
		before { @user.first_name = "x" * 51 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@justice.gov.uk example.user@foo.foo@bar.com foo@bar+baz.com
					user_foo.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			@user.email = "example@department.gsi.gov.uk"
			expect(@user).to be_valid
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "Mismatch" }
		it { should_not be_valid }
	end

	describe "when password_confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should_not be_valid }
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email) }

		describe "with valid password" do
			it { should eql(found_user.authenticate(@user.password)) }
		end

		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not eql(user_for_invalid_password) }
			specify { expect(user_for_invalid_password).to be_false }
		end
	end
end