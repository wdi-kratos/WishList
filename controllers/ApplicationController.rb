class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  # connect to DB using ActiveRecord
  ActiveRecord::Base.establish_connection(
    :adapter  => "postgresql",
    :database => "wishlist"
  )

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public_dir',__FILE__)

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  # will be used to display 404 error pages
  not_found do
    erb :not_found
  end

  # enable session support for our application
  enable :sessions

# Helper methods

  def is_authenicated?
    if session[:current_user].nil? == true
      puts 'not authenticated - GTFO'
      return false
    else
      puts 'authenticated'
      return true
    end
  end

  def current_user
    return session[:current_user]
  end

  def authorization_check
    if is_authenicated? == false
      redirect '/not_authenticated'
    end
  end

  # def build_view_model # create an array made up of a set of hash from the items/user table
  # user_array = []
  #
  # items.each do |item|
  #   userid = session[:current_user].id
  #   item_data = {:item => items.find(items.userid),
  #    :title => items.find(items.title),
  #    :description => items.find(items.description)
  #   end
  #
  # categories.each do |category|
  #     category_data = :category => categories.find(items.attrid)
  #   end
  #
  # users.each do |email|
  #     contact_info = :user_email => users.find(item.userid)}
  #   end
  #   return user_array[item_data, category_data, contact_info]
  # end

end
