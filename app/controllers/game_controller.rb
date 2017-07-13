class GameController < ApplicationController

  get '/games/new' do #get (read) request, if not logged in, redirects to login, if not loards create_game but doesn't? wth
    if !logged_in?
      redirect "/login"
    else
      erb :'games/create_game'
    end
  end

  post '/games' do #post(create) request, if logged in and paramas has doesn't equal new, itll create a new game send render the new game page
    if logged_in?
      if params[:games] != ""
      current_user.games.create(game_params)
      else
        render '/games/new'
      end
  end

  get '/games' do #get read request, show games.erb page
    binding.pry
    if logged_in?
      @games = Game.all
      erb :'games/games'
    else
      redirect "/login"
    end
  end

  get '/games/:id' do #get (Read) request for games, eg it will read localhost.com/3000/games/2. read sthrough param id
    if logged_in?
      @game = Game.find(params[:id])
      erb :'games/show_game'
    else
      redirect "/login"
    end
  end

  get '/games/:id/edit' do #post (create) request for for games, click on said game and get to edit page for it
    if logged_in?
      @game = current_user.games.find(params[:id])
      erb :'/games/edit_game'
    else
      redirect "/login" #will never happen
    end
  end

  patch '/games/:id' do #patch (update) request for games
    #raise params.inspect
    if logged_in?
      game = current_user.games.find(params[:id])
      if game.update(params[:games])
        redirect "/games/#{game.id}"
      else
        redirect "/games/#{game.id}/edit" #redirect edit_game
      end
  end

  delete '/games/:id/delete' do #delete request for game
    if logged_in?
    @game = Game.find(params[:id])
      if current_user.games.include?(@game)
        @game.delete
        redirect '/games'
      else
        redirect '/games'
      end
  end

  private

    def game_params
      { title: params[:game][:title], players: params[:game][:players] }
    end

end
