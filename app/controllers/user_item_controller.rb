class User_itemsController < ApplicationController

    
     get '/user_items' do 
       @newitems = []
        if !!logged_in?
            items =  UserItem.all

            items.each do |item|
                if item.user === current_user 
                    @newitems << item 
                end 
            end 
                
            @dealerservices = DealerService.all 
             erb :'user_items/index'
            
        else
            redirect '/users/login'
        end 
     end 
    
     get '/user_items/show' do 
        
        erb :'user_items/show'
    end
    
    post '/user_items' do 
        
        @newitem = UserItem.create(:user_id => current_user.id, :dealer_services_id => params["dealer_services_id"].to_i, :comment => params["comment"], :time => params["time"])
        
        @dealeritem  =  DealerService.find_by_id(@newitem.dealer_services_id)
        
        erb :'user_items/show'
    end 

    get '/user_items/:id/edit' do
        
        @newitem = UserItem.find_by_id(params[:id])
        erb :'user_items/edit'
    end 

    patch '/user_items/:id' do
        
        @newitem = UserItem.find_by_id(params[:id])
        @dealeritem = DealerService.find_by_id(@newitem[:dealer_services_id])
        
        if @newitem.user === current_user
            if @newitem.update(:comment => params[:comment], :time => params[:time])
                erb :'user_items/show'       
            else
                erb :'user_items/edit'
            end 
        else
            redirect '/user_items' 
        end 
        
    end


    delete '/user_items/:id' do 
        @newitem = UserItem.find_by_id(params[:id])
        
        if @newitem.user === current_user
            @dealeritem = DealerService.find_by_id(@newitem[:dealer_services_id])
            @newitem.destroy
        end 
        redirect '/user_items' 
    end 
end 