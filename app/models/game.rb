class Game < ActiveRecord::Base
  has_many :sessions
  
  def next_turn
    sessions.map{|i| i.next_turn}.min
  end
  
  def last_session
    sessions.sort{|a, b| a.next_turn <=> b.next_turn}.first
  end
  
  def has_winner?
    winner = true
    sessions.each do |session|
      winner &= (session.next_turn == 11)
    end
    winner
  end
  
  def winner
    return nil unless has_winner?
    sessions.max_by{|session| session.total_score}.player
  end
end
