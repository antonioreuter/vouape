# encoding: utf-8

require 'digest/sha2'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :user_promotions
  has_many :promotions, :through => :user_promotions
  

  before_destroy :ensure_not_referenced_by_any_client

  

  USER_TYPES = ["ADMIN", "REGULAR", "CLIENT"]


  #Incluir uma validação no login(Email) utilizando expressoes regulares.

  


  def User.authenticate(login, password)
    if user = find_by_name(login)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "heroku" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end  

  def generate_salt
    #é importante utilizar o self. para chamar o metodo de instancia "salt="
    #caso contrario, estariamos apenas recriando uma variavel de metodo
    #e nao associando o valor para uma variavel de instancia.
    self.salt = self.object_id.to_s + rand.to_s
  end

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end


  def ensure_not_referenced_by_any_client
    if clients
      return false
    else
      return true
    end
  end
  
end
