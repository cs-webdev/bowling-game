class Game
  def initialize
    @current_roll = 0
    @rolls = Array.new 21, 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    score = 0
    frame_index = 0
    1.upto(10) do |frame|
      if strike?(frame_index)
        score += strike_score(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        score += spare_score(frame_index)
        frame_index += 2
      else
        score += frame_score(frame_index)
        frame_index += 2
      end
    end
    score
  end

  private
  def spare?(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1] == 10
  end

  def strike?(frame_index)
    @rolls[frame_index] == 10
  end

  def strike_score(frame_index)
    10 + @rolls[frame_index + 1] + @rolls[frame_index + 2]
  end

  def spare_score(frame_index)
    10 + @rolls[frame_index + 2]
  end

  def frame_score(frame_index)
    @rolls[frame_index] + @rolls[frame_index + 1]
  end
end
