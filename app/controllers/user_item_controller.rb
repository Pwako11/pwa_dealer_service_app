class User_itemsController < ApplicationController
  
    get '/user_items' do 
      
        if logged_in?
            @newitems = []
            @newitems = current_user.user_items  
            
            erb :'user_items/index'   
        else
            redirect '/users/login'
        end 
     end 
    
    get '/user_items/new/:id' do
      
        if logged_in?
            @service = DealerService.find_by_id(params[:id])
            erb :'user_items/new' 
        else
            redirect '/users/login'
        end 
    end    

     get '/user_items/:id' do 
        @newitem = UserItem.find_by_id(params[:id])
        erb :'user_items/show'
    end
    
    post '/user_items' do 
        @newitem = UserItem.new(:user_id => current_user.id, :dealer_service_id => params["dealer_service_id"].to_i, :comment => params["comment"], :time => params["time"])
        if @newitem.save
            redirect "/user_items/#{@newitem.id}"   
                   
        else 
            flash[:error] = "Comment and Time field require an entry. Please provide your comment and enter a preferred time for your service"
            id = params["dealer_service_id"].to_i
            redirect "/user_items/new/#{(id)}"

        end 
    end   

    get '/user_items/:id/edit' do
        
        lookup_item

        erb :'user_items/edit'
    end 

    patch '/user_items/:id' do
        
        lookup_item
        if @newitem.user === current_user
            if @newitem.update(:comment => params[:comment], :time => params[:time])
                redirect '/user_items'
            else 
                flash[:error] = "Comment and Time field require an entry. Please provide your comment and enter a preferred time for your service"
                erb :'user_items/edit' 
            end 
        else   
            redirect '/users/login'
        end     
    end

    delete '/user_items/:id' do 
        
        lookup_item
        
        if @newitem.user === current_user
            @dealeritem = DealerService.find_by_id(@newitem[:dealer_service_id])
            @newitem.destroy
        end 
        redirect '/user_items' 
    end 
end 