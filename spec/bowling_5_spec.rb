require_relative '../lib/bowling_2'

describe 'bowling3' do

end

#initialization
# set = 'X 3- 5/'
# ['X', '3-', '5/']

# miss
# miss = '3-'
# 3

# miss = '9-'
# 9


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