class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
  
end
