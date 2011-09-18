class User < ActiveRecord::Base
  include Gravtastic

  has_secure_password
  has_gravatar
  has_many :posts
  attr_accessor :password_confirmation

  validates_presence_of :password_digest
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
