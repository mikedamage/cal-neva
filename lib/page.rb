class Page
	attr_reader :name, :yaml_prolog, :content
	
	def initialize(name)
		@name = name
	end
end