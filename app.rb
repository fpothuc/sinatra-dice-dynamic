require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:number_of_dice/:how_many_sides") do
  @num_dice = params.fetch("number_of_dice").to_i
  @sides_dice = params.fetch("how_many_sides").to_i
  
  @rolls = []
  
  @sum = 0
  @max = @num_dice * @sides_dice
  @ev = ((1 * @num_dice) + (@sides_dice * @num_dice)) / 2

  @num_dice.times do
    die = rand(1..@sides_dice)

    @rolls.push(die)
    @sum += die
  end

  erb(:flexible)
end
