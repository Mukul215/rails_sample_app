module ApplicationHelper

	# Return a title on a per-page basis
	def title
		base_title = "Mukul's Website"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def logo
		# we made this so that the _header.html.erb does not need it and we can just add the path
		image_tag("logo.png", :alt => "Sample App", :class => "round")
	end
end
