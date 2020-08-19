require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    redirect '/dealerservices' 
  end


#   get '/' do
#     redirect '/user/account' if logged_in?

#     erb :'/welcome
#   end

#   get '/user/dashboard' do
#     redirect?
#     @user = User.find(session[:user_id])

#     erb :dashboard
#   end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user = User.find_by_id(session[:user_id])
    end

    def redirect?
      if !logged_in?
        redirect '/'
      end
    end
  end

end
