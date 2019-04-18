# require_relative '../lib/bowling'

# describe 'test' do
#   context 'sums correctly' do
#     it 'return 4' do
#       expect(2 + 2).to eq 4
#     end
#   end
# end

# describe 'bowling' do
#   it 'scores a perfect strike' do
#     perfect_strike = 'X X X X X X X X X X X X'
#     bowling = Bowling.new(perfect_strike)
#     expect(bowling.score).to eq 300
#   end

#   it 'scores a series of misses' do
#     missed_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9-'
#     bowling = Bowling.new(missed_set)
#     expect(bowling.score).to eq 90
#   end

#   it 'scores a mix of non matching misses' do
#     series_of_misses = '9- 1- 3- 5- 7- 9- 3- 9- 8-'
#     bowling = Bowling.new(series_of_misses)
#     expect(bowling.score).to eq 54
#   end

#   it 'scores a series of spares' do
#     spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5 '
#     bowling = Bowling.new(spare_set)
#     expect(bowling.score).to eq 150
#   end

#   it 'scores a series of mixed spares' do
#     spare_set = '3/ 6/ 5/ 8/ 2/ 4/ 9/ 4/ 1/ 0/9'
#     bowling = Bowling.new(spare_set)
#     expect(bowling.score).to eq 148
#   end

#   it 'scores a series of mixed spares, strikes and misses' do
#     mixed_set = '7- 5- 8/ 7- X X 9- 4/ 3/ 8/6'
#     bowling = Bowling.new(mixed_set)
#     expect(bowling.score).to eq 140
#   end

#   it 'scores a series of mixed spares, strikes and misses' do
#     mixed_set = '7- 7- 8/ 7- X X 9- 4/ X X 7- 1-'
#     bowling = Bowling.new(mixed_set)
#     expect(bowling.score).to eq 160
#   end

#   it 'scores spares correctly' do
#     spare_set = '7/ 7-'
#     bowling = Bowling.new(spare_set)
#     expect(bowling.spare_score(0)).to eq 17
#   end

#   it 'scores spares correctly' do
#     spare_set = '8/ X 1/'
#     bowling = Bowling.new(spare_set)
#     expect(bowling.spare_score(0)).to eq 20
#   end

#   it 'scores spares correctly' do
#     spare_set = '8/ 5/'
#     bowling = Bowling.new(spare_set)
#     expect(bowling.spare_score(0)).to eq 15
#   end

#   it 'scores strikes correctly' do
#     strike_set = 'X 8/ 3-'
#     bowling = Bowling.new(strike_set)
#     expect(bowling.strike_score(0)).to eq 21
#   end

#   it 'scores strikes correctly' do
#     strike_set = 'X 7- 1-'
#     bowling = Bowling.new(strike_set)
#     expect(bowling.strike_score(0)).to eq 18
#   end
# end
