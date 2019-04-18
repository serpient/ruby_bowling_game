require_relative '../lib/bowling_2'

describe 'bowling' do
  it 'returns score' do
    score_set = 'X X /1 -3'
    bowling = Bowling2.new(score_set)
    expect(bowling.score).to eq 'X X /1 -3'
  end
end
