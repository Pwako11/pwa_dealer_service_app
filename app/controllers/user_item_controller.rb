class User_itemsController < ApplicationController
  
     get '/user_items' do 
       @newitems = []
       
        if logged_in?
            items =  UserItem.all

            items.each do |item|
                if item.user === current_user 
                    @newitems << item 
                end 
            end 
             erb :'user_items/index'
        else
            redirect '/users/login'
        end 
     end 
    
     get '/user_items/show' do 
        
        erb :'user_items/show'
    end
    
    post '/user_items' do 
            
        if completed?
            flash[:error] = "Comment and Time field require an entry. Please provide your comment and enter a preferred time for your service"
            id = params["dealer_services_id"].to_i
            rerendor = "/dealerservices/#{(id)}/new"
            redirect rerendor
        else 
            @newitem = UserItem.create(:user_id => current_user.id, :dealer_services_id => params["dealer_services_id"].to_i, :comment => params["comment"], :time => params["time"])    
        end 
        erb :'user_items/show' 
    end   

    get '/user_items/:id/edit' do
        
        lookup_item

        erb :'user_items/edit'
    end 

    patch '/user_items/:id' do
        
        lookup_item

        if completed?
            flash[:error] = "Comment and Time field require an entry. Please provide your comment and enter a preferred time for your service"
            erb :'user_items/edit' 
        end 
            
        if @newitem.user === current_user
            if @newitem.update(:comment => params[:comment], :time => params[:time])
                redirect '/user_items'       
            else
                erb :'user_items/edit'
            end 
        else
            redirect '/users/login' 
        end     
    end


    delete '/user_items/:id' do 
        
        lookup_item
        
        if @newitem.user === current_user
            @dealeritem = DealerService.find_by_id(@newitem[:dealer_services_id])
            @newitem.destroy
        end 
        redirect '/user_items' 
    end 
end 