class ItemsController < ApplicationController


  # Views items on the user's list.
  get '/' do

    authorization_check

      @item = ItemsModel.all
      erb :index
    end

  ## create a new item
  get '/create' do

    authorization_check

    erb :create
  end

  post '/create' do

    authorization_check
    @message = ''

    @item = ItemsModel.new
    @item.userid = session[:current_user].id
    @item.title = params[:title]
    @item.description = params[:description]
    @category.category = params[:category]
    @attribute = AttributesModel.new
    @attribute.color = params[:color]
    @attribute.size = params[:size]
    @attribute.condition = params[:condition]
    @attribute.location = params[:location]
    @attribute.save
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
