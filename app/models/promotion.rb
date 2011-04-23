#encoding: UTF-8



class Promotion < ActiveRecord::Base


  #after_save :define_coordinates

  

  acts_as_geocodable :normalize_address => true



  belongs_to :client

  has_many :user_promotions
  has_many :users, :through => :user_promotions


  #Validations...
  validates :title, :description, :start_date, :finish_date, :presence => true
  validates :street, :locality, :region, :postal_code, :country, :presence => true
  
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :promotional_image, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  def after_initialize
      if (self.id)
        puts '>>>>>>>>>>>>>>>>>>   AFTER INITIALIZE'
        
          puts '>>>>>>>>>>>>>>>>> CALCULANDO A ROTA...'
          begin
          self.latitude = self.geocode.latitude.to_s
          self.longitude = self.geocode.longitude.to_s
          puts '>>>>>>>>>>>>>>>>> ROTA CALCULADA!'
          rescue Exception => e
            puts ">>>>>>>>>>>>>> Erro ao calcular a rota ... "+e.to_s
          end
          #self.save
        
      end

  end
  

   


  

end
