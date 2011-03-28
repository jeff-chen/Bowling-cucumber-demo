class Player < ActiveRecord::Base
  has_many :sessions
end
