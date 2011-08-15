class User < ActiveRecord::Base

  has_secure_password

  has_attached_file :avatar, :styles => { :thumb => ["80x80#", :png] }

  has_many :posts

  attr_accessor :password_confirmation

  serialize :preferences

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  before_save :ensure_preferences_present

  def posts_per_page=( number )
    preferences[:posts_per_page] = number
  end

  def posts_per_page
    preferences[:posts_per_page]
  end

  private

  def ensure_preferences_present
    preferences ||= {}
  end
end
