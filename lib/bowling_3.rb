class Bowling3
    attr_accessor :rolls, :strike, :spare, :miss
    def initialize(rolls)
        @rolls = rolls.split
        @strike = 'X'
        @spare = '/'
        @miss = '-'
    end

    def parse(value)
        value == strike ? 10 : value[/\d/].to_i
    end

    def miss_score(idx) 
        parse(rolls[idx])
    end

    def spare_score(idx)
        return 10 + parse(rolls[idx][-1]) unless next_roll(idx)
        10 + parse(next_roll(idx))
    end

    def next_roll(idx) 
        rolls[idx + 1]
    end

    def strike_score(idx)
        if next_roll(idx) and next_roll(idx + 1)
            10 + parse(next_roll(idx)) + parse(next_roll(idx + 1))
        elsif next_roll(idx) and next_roll(idx).include? spare
            return 10 + parse(next_roll(idx)[0]) + parse(next_roll(idx)[-1])
        else
            0
        end    
    end

    def score()
        score = 0
        rolls.each_with_index do |roll, idx|
            score += strike_score(idx) if roll.include? strike
            score += miss_score(idx) if roll.include? miss
            score += spare_score(idx) if roll.include? spare
        end
        score
    end
end

# took 34 minutes to complete