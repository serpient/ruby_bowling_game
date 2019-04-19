require_relative '../lib/bowling_6'

describe 'bowling6' do
    it 'initializes rolls and splits it' do
        set = 'X 3- 5/'
        bowling = Bowling6.new(set)
        expect(bowling.rolls).to eq ['X', '3-', '5/']
    end

    context 'scores miss' do
        it '3' do
            miss = '3-'
            bowling = Bowling6.new(miss)
            expect(bowling.score_miss(0)).to eq 3
        end

        it '9' do
            miss = '9-'
            bowling = Bowling6.new(miss)
            expect(bowling.score_miss(0)).to eq 9
        end
    end

    context 'scores spares' do
        it '13' do
            spare_set = '9/ 3-'
            bowling = Bowling6.new(spare_set)
            expect(bowling.score_spare(0)).to eq 13
        end

        it '15' do
            spare_set = '9/ 5/'
            bowling = Bowling6.new(spare_set)
            expect(bowling.score_spare(0)).to eq 15
        end

        it '20' do
            spare_set = '9/ X'
            bowling = Bowling6.new(spare_set)
            expect(bowling.score_spare(0)).to eq 20
        end

        it '14' do
            spare_set = '9/4'
            bowling = Bowling6.new(spare_set)
            expect(bowling.score_spare(0)).to eq 14
        end
    end

    context 'scores strikes' do
        it '18' do
            strike_set = 'X 3- 5/'
            bowling = Bowling6.new(strike_set)
            expect(bowling.score_strike(0)).to eq 18
        end

        it '30' do
            strike_set = 'X X X'
            bowling = Bowling6.new(strike_set)
            expect(bowling.score_strike(0)).to eq 30
        end

        it '19' do
            strike_set = 'X 6/3'
            bowling = Bowling6.new(strike_set)
            expect(bowling.score_strike(0)).to eq 19
        end

        it '0' do
            strike_set = 'X'
            bowling = Bowling6.new(strike_set)
            expect(bowling.score_strike(0)).to eq 0
        end
    end

    context 'scores full set' do
        it 'of strikes' do
            strike_set = 'X X X X X X X X X X X X' 
            bowling = Bowling6.new(strike_set)
            expect(bowling.score()).to eq 300
        end

        it 'of misses' do
            miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- ' 
            bowling = Bowling6.new(miss_set)
            expect(bowling.score()).to eq 90
        end

        it 'of spares' do
            spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5' 
            bowling = Bowling6.new(spare_set)
            expect(bowling.score()).to eq 150
        end

        it 'of mixed roll' do
            mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-' 
            bowling = Bowling6.new(mixed_set)
            expect(bowling.score()).to eq 116
        end
    end
end


# map over value pairs to generate test units
# each_with_index could be a reduce fn
# clean up test names of "it" blocks