%w(rubygems pathname ostruct yaml RedCloth haml sass sinatra).each {|lib| require lib }

configure do
	require 'lib/page.rb'
	# require 'lib/article.rb'
	# require 'lib/feed.rb'
	
	CONFIG = OpenStruct.new(YAML.load_file(File.join(Dir.pwd, 'config.yml')))
end

helpers do
	
end

get "/" do
	@page = Page.new('home')
	haml :home
end

# allows us to specify the format of the sass sheet we're loading
# valid options are 'compressed', 'extended', and 'expanded'
# i.e. http://localhost:4567/sass/compressed/main will fetch main.sass and render compressed CSS
get "/sass/:format/:file" do
	content_type 'text/css', :charset => 'utf-8'
	@file = Pathname.new("./views/sass/" + (params[:file] + ".sass"))
	@format = params[:format].intern
	@sass = Sass::Engine.new(@file.read, {:style => @format})
	@sass.render
end
