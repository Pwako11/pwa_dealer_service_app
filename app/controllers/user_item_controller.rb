class User_itemsController < ApplicationController

    post '/user_items' do 
       
        newitem = UserItem.create(:user_id => current_user[:id], :dealer_services_id => params["dealer_services_id"].to_i, :comment => params["comment"])
        
        erb :user_items
    end 

end 