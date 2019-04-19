require_relative '../lib/bowling_4'

describe 'bowling4' do
    it 'initializes new bowling with converted rolls' do
        set = 'X 3- 5/'
        bowling = Bowling4.new(set)
        expect(bowling.rolls).to eq ['X', '3-', '5/']
    end

    context 'scores miss'  do
        it '3' do
            miss = '3-'
            bowling = Bowling4.new(miss)
            expect(bowling.score_miss(0)).to eq 3
        end

        it '5' do
            miss = '5-'
            bowling = Bowling4.new(miss)
            expect(bowling.score_miss(0)).to eq 5
        end
    end 

    context 'scores spare'  do
        it '13' do
            spare = '3/ 3-'
            bowling = Bowling4.new(spare)
            expect(bowling.score_spare(0)).to eq 13
        end

        it '15' do
            spare_set = '9/ 5/'
            bowling = Bowling4.new(spare_set)
            expect(bowling.score_spare(0)).to eq 15
        end

        it '20' do
            spare_set = '9/ X'
            bowling = Bowling4.new(spare_set)
            expect(bowling.score_spare(0)).to eq 20
        end

        it '14' do
            spare_set = '9/4'
            bowling = Bowling4.new(spare_set)
            expect(bowling.score_spare(0)).to eq 14
        end
    end 

    context 'scores strikes'  do
        it '18' do
            strike_set = 'X 3- 5/'
            bowling = Bowling4.new(strike_set)
            expect(bowling.score_strike(0)).to eq 18
        end

        it '30' do
            strike_set = 'X X X'
            bowling = Bowling4.new(strike_set)
            expect(bowling.score_strike(0)).to eq 30
        end

        it '19' do
            strike_set = 'X 6/3'
            bowling = Bowling4.new(strike_set)
            expect(bowling.score_strike(0)).to eq 19
        end

        it '0' do
            strike_set = 'X'
            bowling = Bowling4.new(strike_set)
            expect(bowling.score_strike(0)).to eq 0
        end
    end 

    context 'scores mix set'  do
        it '300' do
            strike_set = 'X X X X X X X X X X X X' 
            bowling = Bowling4.new(strike_set)
            expect(bowling.score()).to eq 300
        end

        it '90' do
            miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- ' 
            bowling = Bowling4.new(miss_set)
            expect(bowling.score()).to eq 90
        end

        it '150' do
            spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5' 
            bowling = Bowling4.new(spare_set)
            expect(bowling.score()).to eq 150
        end

        it '116' do
            mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-' 
            bowling = Bowling4.new(mixed_set)
            expect(bowling.score()).to eq 116
        end
    end
end



# spares
# spare_set = '9/ 3-'
# 13

# spare_set = '9/ 5/'
# 15

# spare_set = '9/ X'
# 20

# spare_set = '9/4'
# 14


# strikes
# strike_set = 'X 3- 5/'
# 18

# strike_set = 'X X X'
# 30

# strike_set = 'X 6/3'
# 19

# invalid_strike_set = 'X'
# 0


# strike_set = 'X X X X X X X X X X X X' 
# 300

# miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- ' 
# 90

# spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5' 
# 150

# mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-' 
# 116

# mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4/5' 
# 127

# mixed_set = '3/ 6/ 5/ 8/ 2/ 4/ 9/ 4/ 1/ 0/9' 
# 148