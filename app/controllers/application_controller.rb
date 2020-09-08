require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    redirect '/dealerservices' 
  end

  helpers do

    def lookup_item
      @newitem = UserItem.find_by_id(params[:id])
    end 

    def completed?
      params[:comment].empty? || params[:time].empty?
    end 

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect?
      if !logged_in?
        redirect '/'
      end
    end
  end

end
