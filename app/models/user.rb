class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  attr_accessor :password_confirmation

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
