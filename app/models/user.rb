class User < ActiveRecord::Base
    has_many :user_items 
    has_many :dealer_services, through: :user_items

    has_secure_password
end
