module ApplicationHelper

	def full_title(partial)
		base = "Odin Facebook Clone"
		if !partial.empty?
			"#{partial} | #{base}"
		else
			base
		end
	end
end
