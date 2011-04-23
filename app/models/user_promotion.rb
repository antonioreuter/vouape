
#Define what promotions the users saw it.
class UserPromotion < ActiveRecord::Base
  belongs_to :user
  belongs_to :promotion

  
end
