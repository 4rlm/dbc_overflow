class Vote < ActiveRecord::Base
  belongs_to :users
  belongs_to :votable, polymorphic: true

end
