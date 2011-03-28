class Frame < ActiveRecord::Base
  belongs_to :session
  validate :total_score_cant_exceed_ten
  
  def player
    session.player
  end
  
  def game
    session.game
  end
  
  def previous_frame
    session.frames.select{|i| i.turn == self.turn - 1}.first
  end
  
  def is_strike?
    first_frame.to_i == 10
  end
  
  def is_spare?
    first_frame.to_i != 10 && (first_frame.to_i + second_frame.to_i == 10)
  end
  
  def display
    if first_frame == 10
      "X"
    elsif (first_frame.to_i + second_frame.to_i) == 10
      "#{first_frame.to_i}| /"
    else
      "#{first_frame.to_i}|#{second_frame.to_i}"
    end
  end
  
  private
  
  def total_score_cant_exceed_ten
    if first_frame.to_i + second_frame.to_i > 10
      errors.add_to_base("Total score can't exceed 10")
    end
  end
end
