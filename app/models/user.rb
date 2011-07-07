class User < ActiveRecord::Base

  has_secure_password

  has_attached_file :avatar, :styles => { :thumb => ["80x80#", :png] }

  has_many :posts

  attr_accessor :password_confirmation

  serialize :preferences

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email

end
