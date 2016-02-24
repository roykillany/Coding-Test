module ApplicationHelper
	include ProductHelper
	
	def username(user)
		user.username if user && user.username.present?
	end

	def display_error(type, errors)
		"<span class='errors #{type}'>
			<span class='arrow'></span>
			#{errors.select {|error| error.downcase.match(type)}[0]}
		</span>".html_safe if type && errors && !errors.select {|error| error.downcase.match(type)}.empty?
	end
end