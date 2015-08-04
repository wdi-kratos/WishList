class HomeController < ApplicationController

  get '/' do
    erb :index
  end

  get '/not_authenticated' do
    erb :not_authenticated
  end

end
