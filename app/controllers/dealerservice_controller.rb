class DealerServicesController < ApplicationController 

      
    get '/dealerservices' do
     @services = DealerService.all
      erb :'dealerservices/index'
    end
  
    get '/dealerservices/:id' do
        @service = DealerService.find_by_id(params[:id])
        erb :'dealerservices/show'
    end
    
  end