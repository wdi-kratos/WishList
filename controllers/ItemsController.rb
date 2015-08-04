class ItemsController < ApplicationController


# Create a new list item
get '/' do
erb :index
end

post '/create' do
erb :item_create
end

# Edit an existing Item

end
