class Answer < ActiveRecord::Base
  belongs_to :users
  belongs_to :questions
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

end
