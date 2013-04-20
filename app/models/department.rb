class Department < ActiveRecord::Base
	validates :full_name, presence: true, length: { minimum: 6 }
end
