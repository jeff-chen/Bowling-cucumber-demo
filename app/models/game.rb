class Game < ActiveRecord::Base
  has_many :sessions
  
  def next_turn
    sessions.map{|i| i.next_turn}.min
  end
  
  def last_session
    sessions.sort{|a, b| a.next_turn <=> b.next_turn}.first
  end
end
