class Bowling2
  attr_accessor :rolls, :spare, :strike, :miss

  def initialize(rolls)
    @rolls = split(rolls)
    @spare = '/'
    @strike = 'X'
    @miss = '-'
  end

  def split(rolls)
    rolls.split
  end

  def parse(value)
    value == strike ? 10 : value[/\d/].to_i
  end

  def get_next_roll(roll_idx)
    rolls[roll_idx + 1]
  end

  def get_next_roll_score(roll_idx)
    parse(get_next_roll(roll_idx))
  end

  def spare_score(roll_idx)
    if rolls[roll_idx + 1]
      10 + get_next_roll_score(roll_idx)
    else
      10 + parse(rolls[roll_idx][-1])
    end
  end

  def strike_score(roll_idx)
    if rolls[roll_idx + 2] && rolls[roll_idx + 1]
      10 + get_next_roll_score(roll_idx) + get_next_roll_score(roll_idx + 1)
    elsif rolls[roll_idx + 1] and rolls[roll_idx + 1].include? spare
      10 + parse(get_next_roll(roll_idx)[0]) + parse(get_next_roll(roll_idx)[-1])
    else
      0
    end
  end

  def miss_score(roll_idx)
    parse(rolls[roll_idx])
  end

  def score
    score = 0
    rolls.each_with_index do |roll, roll_idx|
      case 
      when roll_idx >= 10
        break
      when roll.include?(spare)
        score += spare_score(roll_idx)
      when roll.include?(strike)
        score += strike_score(roll_idx)
      when roll.include?(miss)
        score += miss_score(roll_idx)
      end
    end
    score
  end
end
