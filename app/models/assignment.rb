class Assignment < ActiveRecord::Base
	belongs_to :department
	belongs_to :user
	

	validates :title, presence: true, length: { minimum: 6 }
	validates :description, presence: true, length: { minimum: 30 }
	validates :band, presence: true
	validates :length, presence: true
	validates :user_id, presence: true
	validates :department_id, presence: true

end
