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
      puts 'not authenticated'
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



end
