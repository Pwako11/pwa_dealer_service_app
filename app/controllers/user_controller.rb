class UsersController < ApplicationController

  get '/signup' do 
    erb :'users/signup'
  end 

  post '/signup' do 
    if  user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      
      session[:user_id] = user.id
      redirect '/users/account'
    else
      flash[:error] = "All fields must be completed"
      erb :'users/signup'
    end      
  end 

  get '/users/account' do
    @user = User.find(session[:user_id])
    @newitems = []
    items =  UserItem.all
    items.each do |item|
      if item.user === current_user 
        @newitems << item 
      end 
    end 
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
      flash[:error] = "Invalid credentials. Try again"
      redirect '/users/login'
    end
  end

  get "/logout" do
    session.clear
    redirect '/'
  end
end