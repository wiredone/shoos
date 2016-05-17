require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('models/preorder')

##creating a route

get '/preorders/new' do
  erb( :new )
end

get '/' do
  @preorder = PreOrder.all

  erb ( :index )

end

  post '/preorder' do

  @preorder = PreOrder.new(params)
  @preorder.save()
  erb ( :create )
 end
