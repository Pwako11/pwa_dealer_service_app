class UsersController < ApplicationController

    get '/signup' do 
        erb :'users/signup'
    end 

    post '/signup' do 
        
        if params[:username].empty?
            redirect to '/users/failure'
          eslif  params[:email].empty? 
            redirect to '/users/failure'
          elsif params[:password].empty?
            redirect to '/users/failure'
          end 
         
          @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
         
          if user.save
            redirect '/users/login'
          else
            redirect '/users/failure'
          end
    end 

    get '/users/account' do
        @user = User.find(session[:user_id])
        erb :'users/account'
    end
 
    get '/users/login' do 
        erb :'users/login'
    end 

    post "/login" do
        @user = User.find_by(:username => params[:username])
    
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to '/users/account'
        else
          redirect to '/users/failure'
        end
    end

    get '/users/failure' do
        erb :'users/failure'
    end

    get "/logout" do
        session.clear
        redirect '/'
    end
end 
