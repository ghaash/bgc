class GameController < ApplicationController

  get '/games/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :'games/create_game'
    end
  end

  post '/games' do
    if logged_in?
      if params[:content] != ""
      @tweet = current_user.games.create(content: params[:content])
        redirect '/games'
      else
        redirect '/games/new'
      end
    else
      redirect '/login'
    end
  end

  get '/games' do
    if logged_in?
      @game= Game.all
      erb :'games/games'
    else
      redirect "/login"
    end
  end

  get '/games/:id' do
    if logged_in?
      @game= Game.find(params[:id])
      erb :'games/show_game'
    else
      redirect "/login"
    end
  end

  get '/games/:id/edit' do
    if logged_in?
      @game = current_user.games.find(params[:id])
      erb :'/games/edit_game'
    else
      redirect "/login"
    end
  end

  patch '/games/:id' do
    if logged_in?
      @game = current_user.games.find(params[:id])
      if params[:content] != ""
        @game.update(content: params[:content])
        redirect "/games/#{@game.id}"
      else
        redirect "/games/#{@game.id}/edit"
      end
    else
      redirect '/login'
    end
  end

  delete '/games/:id/delete' do
    if logged_in?
    @game = Game.find(params[:id])
      if current_user.games.include?(@game)
        @game.delete
        redirect '/games'
      else
        redirect '/games'
      end
    else
      redirect '/login'
    end
  end

end
