class Bowling6
    attr_accessor :rolls, :miss, :spare

    # class static variable below
    STRIKE = 'X'
    
    def initialize(rolls)
        @rolls = rolls.split
        @spare = '/'
        @miss = '-'
    end

    def parse(value)
        value == STRIKE ? 10 : value[/\d/].to_i
    end

    def next_roll(idx)
        rolls[idx + 1]
    end

    def score_miss(idx)
        parse(rolls[idx])
    end

    def score_spare(idx)
        return 10 + parse(rolls[idx][-1]) unless next_roll(idx)
        10 + parse(next_roll(idx))
    end

    def score_strike(idx)
        if next_roll(idx) and next_roll(idx + 1)
            10 + parse(next_roll(idx)) +  parse(next_roll(idx + 1))
        elsif next_roll(idx) and next_roll(idx).include? spare
            return 10 + parse(next_roll(idx)) + parse(next_roll(idx)[-1])
        else
            0
        end
    end

    def score()
        score = 0
        rolls.each_with_index do |roll, idx|
            score += score_strike(idx) if roll.include? STRIKE
            score += score_miss(idx) if roll.include? miss
            score += score_spare(idx) if roll.include? spare
        end
        score
    end
end




# value[/\d/].to_i