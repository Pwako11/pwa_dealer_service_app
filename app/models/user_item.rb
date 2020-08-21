class UserItem < ActiveRecord::Base
    belongs_to :user 
    belongs_to :dealer_services 

end
