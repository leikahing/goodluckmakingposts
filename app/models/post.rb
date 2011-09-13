class Post < ActiveRecord::Base
  belongs_to :user
  paginates_per 3
  delegate :email, :name, :title, :to => :user
end
