class Bowling
  attr_accessor :bowling_scores, :miss, :spare, :strike

  def initialize(bowling_scores)
    @bowling_scores = bowling_scores.split
    @miss = '-'
    @spare = '/'
    @strike = 'X'
  end

  def extract_integer(value)
    value[/\d/].to_i
  end

  def get_value_of(roll)
    roll.include?(strike) ? 10 : extract_integer(roll)
  end

  def next_roll_score(current_idx)
    next_idx = current_idx + 1
    get_value_of(bowling_scores[next_idx])
  end

  def score_of(current_idx)
    bowling_scores[current_idx]
  end

  def last_score_position
    bowling_scores.length - 1
  end

  def last_valid_roll
    10
  end

  def spare_score(current_idx)
    last_spare_roll = get_value_of(score_of(current_idx)[-1])
    score = current_idx == last_score_position ? last_spare_roll : next_roll_score(current_idx)
    score + 10
  end

  def strike_score(current_idx)
    current_idx <= last_score_position - 2 ? 10 + next_roll_score(current_idx) + next_roll_score(current_idx + 1) : 0
  end

  def miss_score(current_idx)
    extract_integer(score_of(current_idx))
  end

  def score
    score = 0
    bowling_scores.each_with_index do |current_roll, current_roll_idx|
      return score if current_roll_idx + 1 > 10

      score += miss_score(current_roll_idx) if current_roll.include? miss
      score += spare_score(current_roll_idx) if current_roll.include? spare
      score += strike_score(current_roll_idx) if current_roll.include? strike
    end
    score
  end
end
