class Session < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :frames
  
  def total_score
    score = 0
    frames.each do |frame|
      if frame.previous_frame
        if frame.previous_frame.is_spare?
          score += frame.first_frame.to_i
        end
        if frame.previous_frame.is_strike?
          score += frame.first_frame.to_i
          score += frame.second_frame.to_i
        end
      end
      score += frame.first_frame.to_i
      score += frame.second_frame.to_i
    end
    score
  end
  
  def next_turn
    if frames.any?
      frames.select{|i| i.first_frame && i.second_frame }.sort{|a, b| a.turn <=> b.turn}.last.turn + 1
    else
      1
    end
  end
  
end
