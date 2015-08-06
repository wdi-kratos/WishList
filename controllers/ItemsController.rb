class ItemsController < ApplicationController


  # Views items on the user's list.
  get '/' do
    authorization_check
      # @item = ItemsModel.find(session[:current_user]).id
      @items = ItemsModel.all

      @haves = Array.new
      @wants = Array.new
      @matches = Array.new
      userid = session[:current_user].id

      @items.each do |item|

        if item.userid == userid

          if item.itemtype == true
            @haves.push(item)
          else
            @wants.push(item)
          end
        else
          match = Hash.new
          match[:email] = UsersModel.find(item.userid).user_email
          match[:title] = item.title
          @matches.push(match)
        end
      end

      # categories.each do |category|
      #     category_data = :category => {categories.find(items.attrid)}
      #   end
      #
      # users.each do |email|
      #     contact_info = :user_email => users.find(item.userid)}
      #   end
      #
      #   return user_array[item_data, category_data, contact_info]

      puts '----------yolo-----------'
      puts @wants
      puts @haves
      puts '----------yolo-----------'

      erb :index

    end

  ## create a new item
  get '/create' do
    authorization_check
    erb :create
  end

  post '/create' do
    authorization_check

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
    @item.categoryid = params[:category].to_i #not working! select from dropdown
    @item.itemtype = user_wants_item #Radio button = F
    @item.itemtype = user_has_item # Radio button = T
    @item.save

    @message = 'has been sucessfully added to your list'
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
