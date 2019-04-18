require_relative '../lib/bowling_2'

describe 'bowling' do
  it 'returns transformed rolls set' do
    rolls_set = 'X X 1/ 3-'
    bowling = Bowling2.new(rolls_set)
    expect(bowling.rolls).to eq ['X', 'X', '1/', '3-']
  end

  context 'returns miss score' do
    it '5' do
      miss_set = '5-'
      bowling = Bowling2.new(miss_set)
      expect(bowling.miss_score(0)).to eq 5
    end

    it '3' do
      miss_set = '3-'
      bowling = Bowling2.new(miss_set)
      expect(bowling.miss_score(0)).to eq 3
    end
  end

  context 'returns spare score' do
    it '13' do
      spare_set = '5/ 3-'
      bowling = Bowling2.new(spare_set)
      expect(bowling.spare_score(0)).to eq 13
    end

    it '17' do
      spare_set = '5/ 7-'
      bowling = Bowling2.new(spare_set)
      expect(bowling.spare_score(0)).to eq 17
    end

    it '20' do
      spare_set = '5/ X'
      bowling = Bowling2.new(spare_set)
      expect(bowling.spare_score(0)).to eq 20
    end

    it '12' do
      spare_set = '5/ 2/'
      bowling = Bowling2.new(spare_set)
      expect(bowling.spare_score(0)).to eq 12
    end

    it '14' do
      spare_set = '5/4'
      bowling = Bowling2.new(spare_set)
      expect(bowling.spare_score(0)).to eq 14
    end

    it '18' do
        spare_set = '4/ 8/4'
        bowling = Bowling2.new(spare_set)
        expect(bowling.spare_score(0)).to eq 18
      end
  end

  context 'returns strike score' do
    it '22' do
      strike_set = 'X 5/ 7-'
      bowling = Bowling2.new(strike_set)
      expect(bowling.strike_score(0)).to eq 22
    end

    it '30' do
      strike_set = 'X X X'
      bowling = Bowling2.new(strike_set)
      expect(bowling.strike_score(0)).to eq 30
    end

    it '25' do
        strike_set = 'X 8/ 7/7'
        bowling = Bowling2.new(strike_set)
        expect(bowling.strike_score(0)).to eq 25
    end
  
    it '22' do
      strike_set = 'X 5/7'
      bowling = Bowling2.new(strike_set)
      expect(bowling.strike_score(0)).to eq 22
    end

    it '0' do
      strike_set = 'X'
      bowling = Bowling2.new(strike_set)
      expect(bowling.strike_score(0)).to eq 0
    end
  end

  context 'returns score for mixed values' do
    it '300' do
      strike_set = 'X X X X X X X X X X X X'
      bowling = Bowling2.new(strike_set)
      expect(bowling.score).to eq 300
    end

    it '90' do
        miss_set = '9- 9- 9- 9- 9- 9- 9- 9- 9- 9- '
        bowling = Bowling2.new(miss_set)
        expect(bowling.score).to eq 90
    end

    it '150' do
        spare_set = '5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5'
        bowling = Bowling2.new(spare_set)
        expect(bowling.score).to eq 150
    end

    it '33' do
        mixed_set = '5- 8/ 9-'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 33
    end

    it '61' do
        mixed_set = '5- 8/ 9- 9/ 9-'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 61
    end

    it '98' do
        mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9-'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 98
    end

    it '116' do
        mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4-'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 116
    end

    it '127' do
        mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4/5'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 127
    end

    it '111' do
        mixed_set = '5- 8/ 9- 9/ 9- 5/ 9- 9- 3/ 4/5'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 111
    end

    it '148' do
        mixed_set = '3/ 6/ 5/ 8/ 2/ 4/ 9/ 4/ 1/ 0/9'
        bowling = Bowling2.new(mixed_set)
        expect(bowling.score).to eq 148
    end
  end
end
