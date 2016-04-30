class User < ActiveRecord::Base
  #before_create :set_user_type
  has_many :assignments
  has_many :pathways
  belongs_to :department
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Helper method to check current_user is content_admin , local_admin or user
  def content_admin?
  	self.type=="ContentAdmin" 
  end
  def local_admin?
  	self.type=="LocalAdmin" 
  end
  def user?
  	self.type=="LocalUser" 
  end

  #Helper method to set user type default as user
  # def set_user_type
  #   self.type="LocalUser" 
  # end

  def fullname
    "#{self.first_name} #{self.last_name}"
  end

end
