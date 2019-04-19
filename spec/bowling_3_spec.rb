require_relative '../lib/bowling_3'

describe 'bowling3' do
    it 'initiates new class with converted rolls set' do
        rolls_set = 'X 9- 5/'
        bowling = Bowling3.new(rolls_set)
        expect(bowling.rolls).to eq ['X', '9-', '5/']
    end

    context 'scores miss set' do
        it '9' do
            miss = '9-'
            bowling = Bowling3.new(miss)
            expect(bowling.miss_score(0)).to eq 9
        end

        it '3' do
            miss = '3-'
            bowling = Bowling3.new(miss)
            expect(bowling.miss_score(0)).to eq 3
        end
    end

    context 'scores spare set' do
        it '13' do
            spare_set = '9/ 3-'
            bowling = Bowling3.new(spare_set)
            expect(bowling.spare_score(0)).to eq 13
        end

        it '15' do
            spare_set = '9/ 5/'
            bowling = Bowling3.new(spare_set)
            expect(bowling.spare_score(0)).to eq 15
        end

        it '20' do
            spare_set = '9/ X'
            bowling = Bowling3.new(spare_set)
            expect(bowling.spare_score(0)).to eq 20
        end

        it '14' do
            spare_set = '9/4'
            bowling = Bowling3.new(spare_set)
            expect(bowling.spare_score(0)).to eq 14
        end
    end

    context 'scores strike set' do
        it '18' do
            strike_set = 'X 3- 5/'
            bowling = Bowling3.new(strike_set)
            expect(bowling.strike_score(0)).to eq 18
        end

        it '21' do
            strike_set = 'X 6/ 5-'
            bowling = Bowling3.new(strike_set)
            expect(bowling.strike_score(0)).to eq 21
        end

        it '30' do
            strike_set = 'X X X'
            bowling = Bowling3.new(strike_set)
            expect(bowling.strike_score(0)).to eq 30
        end

        it '19' do
            strike_set = 'X 6/3'
            bowling = Bowling3.new(strike_set)
            expect(bowling.strike_score(0)).to eq 19
        end

        it 'invalid' do
            invalid_strike_set = 'X'
            bowling = Bowling3.new(invalid_strike_set)
            expect(bowling.strike_score(0)).to eq 0
        end
    end

    context 'scores mixed set' do
        it '300' do
            strike_set = 'X X X X X X X X X X X X'
            bowling = Bowling3.new(strike_set)
            expect(bowling.score()).to eq 300
        end

        it '90' do
            miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- '
            bowling = Bowling3.new(miss_set)
            expect(bowling.score()).to eq 90
        end

        it '150' do
            spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5'
            bowling = Bowling3.new(spare_set)
            expect(bowling.score()).to eq 150
        end

        it '116' do
            mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-' 
            bowling = Bowling3.new(mixed_set)
            expect(bowling.score()).to eq 116
        end

        it '127' do
            mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4/5'
            bowling = Bowling3.new(mixed_set)
            expect(bowling.score()).to eq 127
        end

        it '148' do
            mixed_set = '3/ 6/ 5/ 8/ 2/ 4/ 9/ 4/ 1/ 0/9'
            bowling = Bowling3.new(mixed_set)
            expect(bowling.score()).to eq 148
        end
    end
end


# strike_set = 'X X X X X X X X X X X X' 300

# miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- ' 90

# spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5' 150

# mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-' 116

# mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4/5' 127

# mixed_set = '3/ 6/ 5/ 8/ 2/ 4/ 9/ 4/ 1/ 0/9' 148