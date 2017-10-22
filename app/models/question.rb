class Question < ActiveRecord::Base
  belongs_to :users
  has_many :answers
  has_many :comments, as: :commentable

end
