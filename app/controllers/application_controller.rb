require "./config/environment"
require "./app/models/user"
require "./app/models/game"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret"
  end

  get '/' do
    erb :index
  end

  helpers do
  		def logged_in?
  			!!current_user
  		end

  		def current_user
  			@current_user ||= User.find(session[:user_id]) if session[:user_id]
  		end
  	end

end