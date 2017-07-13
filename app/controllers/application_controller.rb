require "./config/environment" #env file with all the
require "./app/models/user" #linking with user class
require "./app/models/game" #linking with game class

class ApplicationController < Sinatra::Base # class app control w/ sinatra

  configure do #config setting up public_folder, views, enable sessions cookies so you stay logged in on the app
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret"
  end

  get '/' do # goes to index.erb file
    erb :index
  end

  helpers do
  		def logged_in? #checks if current user is logged in
  			!!current_user #no idea what !! means, ! means !false is true #checks for
  		end

  		def current_user #finds user
  			 @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  		end
  	end

end
