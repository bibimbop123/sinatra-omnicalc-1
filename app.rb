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
get "/payment/new" do
  '<form action="/payment">
    <label for="apr">APR</label>
    <input id="apr" name="apr">
    <label for="yearsRemaining">Number of years</label>
    <input id="yearsRemaining" name="yearsRemaining">
    <label for="principal">Principal</label>
    <input id="principal" name="principal">
    <button type="submit">Calculate Monthly Payment</button>
    </form>'
end

get "/payment" do
  r = params["apr"].to_f / 1200
  n = params["yearsRemaining"].to_i * 12
  pv = params["principal"].to_i
  
  payment = (r * pv) / (1 - (1 + r)**-n)
 
  formatted_payment = format("$%.2f", payment.round(2)) 
  formatted_percentage = format("%.4f%%", (payment / pv) * 100) 
  
  "Your payment is #{formatted_payment} (#{formatted_percentage})"
end
