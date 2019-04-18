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

  def spare_score(roll_idx)
    if rolls[roll_idx + 1]
      10 + parse(rolls[roll_idx + 1])
    else
      parse(rolls[roll_idx][0]) + parse(rolls[roll_idx][-1])
    end
  end

  def strike_score(roll_idx)
    if rolls[roll_idx + 2] && rolls[roll_idx + 1]
      10 + parse(rolls[roll_idx + 1]) + parse(rolls[roll_idx + 2])
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
