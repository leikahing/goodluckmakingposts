class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :thread
  belongs_to :previous, :class_name => :post

  paginates_per 3
end
