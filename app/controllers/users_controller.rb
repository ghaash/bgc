class UsersController < ApplicationController

  get '/users/:slug' do #get (Read) user through a slug
    @user= User.find_by_slug(params[:slug])
    erb :'users/show_user'
  end

  get '/signup' do #get (read) sign up page
    if logged_in?
      redirect '/games'
    else
      erb :'users/create_user'
    end
  end

  post "/signup" do #post (create) sign up page to submit
    if !logged_in?
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect "/games"
      else
        redirect '/signup'
      end
    else
      redirect '/games'
    end
  end

  get '/login' do #get read request logs in user to games view
    if !logged_in?
      erb :'users/login'
    else
      redirect "/games"
    end
  end

  post "/login" do #post create user!
    if logged_in?
      redirect "/games"
    else
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/games"
      else
        redirect "/login"
      end
    end
  end


  get '/logout' do #get read request to logout user
    session.clear
    redirect '/login'
  end
end
