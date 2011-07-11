class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :thread
  belongs_to :previous, :class_name => :post

end
