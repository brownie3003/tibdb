module StaticPagesHelper

	def manager?
		current_user.role == "Manager"
	end
end
