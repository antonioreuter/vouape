# encoding: utf-8

class Client < ActiveRecord::Base
  has_many :promotions, :dependent => :destroy
  

  before_destroy :ensure_not_referenced_by_any_promotion



  validates :name, :address, :phone_1, :presence => true
  validates :name, :uniqueness => true
  

   def ensure_not_referenced_by_any_promotion
    if promotions.count.zero?
      return true
    else
      errors.add(:base, 'Promotions present')
      return false
    end
  end


end
