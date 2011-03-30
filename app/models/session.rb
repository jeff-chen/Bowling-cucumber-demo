class Session < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :frames
  
  def total_score
    #there is a much better way to do this that makes the code really elegant but i can't be bothered
    score = 0
    frames.each do |frame|
      if frame.is_spare?
        if frame.next
          score += frame.next.first_frame.to_i
        end
      elsif frame.is_strike?
        if frame.next
          if frame.next.is_strike?
            score += frame.next.first_frame.to_i
            if frame.next.next
              score += frame.next.next.first_frame.to_i
            end
          else
            score += frame.next.first_frame.to_i
            score += frame.next.second_frame.to_i
          end
        end
      end
      score += frame.first_frame.to_i
      score += frame.second_frame.to_i
    end
    score
  end
  
  def next_turn
    if frames.any?
      frames.select{|i| i.turn }.sort{|a, b| a.turn <=> b.turn}.last.turn + 1
    else
      1
    end
  end
  
end
