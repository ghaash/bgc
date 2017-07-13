User fills out form
HTTTP request with POst verb and /games url
Run rake middleware to handle HTTP Requests
matches HTTP route and HTTp  verb with available routes in the controlle
controller then manages the request by interacting with the model
-> binding pry
the model then interacts with the database
the database returns response to model
model returns response to controller
controller displays the view with or without model information

params = {"content" => "Risk"}
params = {
  "game" => {"title" => "Risk", "players" => "2-6", "difficulty" => "easy"},
  "user" => {"username" => "monkey"}

  to_do_list
  READ:
  array
  hash
  params
  routes
  lifecycle (from entering the url to finish)

  program:
  add to forms
  ^number of players
  ^description
  ^mechanics

#REQUEST CYCLE

#1 Client makes HTTP request (goes to website.) Sinatra grabs it and routes it to the correct action (through controller.)

#2 Action (controller) asks model for objects

#3 model asks for the database

#4 Database response

#5 model sends objects (model) to action (controller)

#6 Action (controller) sends objects (model) to view for rendering (make new page for user)

#7 View responds with HTML

#8 Controller sends back HTML in HTTP response

what i want form luke

never to be confused about game, games, @game, @games, @@game, @@games, :game, :game, :games, games:
