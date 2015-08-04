class HomeController < ApplicationController

  get '/' do
    erb :welcome
  end

  get '/not_authenticated' do
    erb :not_authenticated
  end

end
