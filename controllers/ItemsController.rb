class ItemsController < ApplicationController


  # Views items on the user's list.
  get '/index' do
    authorization_check
      # @item = ItemsModel.find(session[:current_user]).id
      @item =ItemsModel.where(userid: session[:current_user].id)
      erb :index
    end

  ## create a new item
  get '/create' do
    authorization_check
    erb :create
  end

  post '/create' do
    authorization_check

    puts params
    puts '-----'

    user_wants_item = params.has_key?('wants_item')

    puts params
    puts '-----'

    user_wants_item = params.has_key?('wants_item')
    user_has_item = params.has_key?('has_item')

    puts user_has_item
    puts user_wants_item

    puts '-----'

    @message = ''

    @item = ItemsModel.new

    @attribute = AttributesModel.new
    @attribute.color = params[:color]
    @attribute.size = params[:size]
    @attribute.condition = params[:condition]
    @attribute.location = params[:location]
    @attribute.save

    @item.userid = session[:current_user].id
    @item.attrid = @attribute.id
    @item.title = params[:title]
    @item.description = params[:description]
    @item.categoryid = params[:category] #not working! select from dropdown
    @item.type = params[:has_item] #Radio button BOOLEAN
    @item.type = params[:wants_item]

    @item.save

    @message = 'has been sucessfully added to your list!'
    erb :item_notification
  end

  ## update (edit) items on the list individually. Bonus -> enhance UI via AJAX?

  get '/edit/:id' do

    authorization_check

    @id = params[:id]
    @item = ItemsModel.find(@id)

    erb :edit
  end

  post '/edit' do

    authorization_check
    @message = ''

    @item = ItemsModel.find(params[:id])
    @item.title = params[:title]
    @item.description = params[:description]
    @item.color = params[:color]
    @item.size = params[:size]
    @item.condition = params[:condition]
    @item.location = params[:location]
    @item.save

    @message = 'has been sucessfully modified from your list!'
    erb :item_notification

  end

  ## delete list record

  post '/delete' do

    authorization_check
    @message = ''

    @id = params[:id]
    @item = ItemsModel.find(@id)
    @item.destroy

    @message = 'has been sucessfully removed from your list!'
    erb :item_notification
  end


end
