module ApplicationHelper

	def full_title(partial)
		base = "Odin Facebook Clone"
		if !partial.empty?
			"#{partial} | #{base}"
		else
			base
		end
	end

	def avatar_for(user)
		"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=48"
	end
end
