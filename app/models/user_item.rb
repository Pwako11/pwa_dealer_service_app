class UserItem < ActiveRecord::Base
    belongs_to :user 
    belongs_to :dealer_services 

    validates :comment, presence: true
    validates :time, presence: true

end
