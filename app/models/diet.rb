class Diet < ActiveRecord::Base
	belongs_to :recipe

	def diet_select_options_array
		diet_select_options = []
		Diet.all.each do |diet|
			diet_select_options.push([diet.long_description, diet.search_value])
		end
		diet_select_options
	end
end
