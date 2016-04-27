class User < ActiveRecord::Base
  has_many :assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def content_admin?
  	self.type=="ContentAdmin" 
  end
  def local_admin?
  	self.type=="LocalAdmin" 
  end
  def user?
  	self.type=="User" 
  end

end
