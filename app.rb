require "sinatra"
require "sinatra/reloader"

get("/") do
  @title = `<h1Welcome to your OMNICALC-1 App!</h1>`


  erb :layout
end

get("/square/new") do
  '<form action="/square">
  <label for="square"> Enter a number </label>
  <input id="square" name=number>
  <button type="submit">Calculate Square</button>
  </form>'
end

get "/square" do
  input_number = params['number'].to_f
  

  square_result = input_number * input_number
  
  "The square of #{input_number} is #{square_result}"
end

get("/square_root/new") do
  '<form action="/square_root">
  <label for="square_root"> Enter a number </label>
  <input id="square_root" name=number>
  <button type="submit">Calculate square root</button>
  </form>'
end

get "/square_root" do
  input_number = params['number'].to_f
  square_root_result = input_number ** (0.5)
  "The square root of #{input_number} is #{square_root_result}"
end
get("/random/new") do
  '<form action="/random">
    <label for="min_input">Minimum</label>
    <input id="min_input" name="min_input">
    <label for="max_input">Maximum</label>
    <input id="max_input" name="max_input">
    <button type="submit">Pick random number</button>
  </form>'
end
get "/random" do
  minimum = params['min_input'].to_f
  maximum = params['max_input'].to_f

  if minimum >= 1.0 && maximum <= 10.0
    random = rand(min_input..max_input)
    "The random number between #{min_input.to_i} and #{max_input.to_i} is #{random.to_i}"
  else
    "Please provide minimum and maximum values between 1 and 10."
  end
end
