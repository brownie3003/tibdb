class Department < ActiveRecord::Base
	validates :full_name, presence: true, length: { minimum: 6 }

	## Need to get model of departments on new user view instead of submitting string.
	has_many :users
	has_many :assignments
end
