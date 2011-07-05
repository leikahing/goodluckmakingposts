class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :password, :password_confirmation

  serialize :preferences

  validates :password, :presence => { :on => :create }
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

end
