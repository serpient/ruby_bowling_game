clearing :on

guard :rspec, cmd: 'bundle exec rspec --color' do
  # watch /lib/ files
  watch(%r{^lib/(.+).rb$}) do |_m|
    'spec/bowling_2_spec.rb'
    # "spec/#{m[1]}_spec.rb"
  end

  # watch /spec/ files
  watch(%r{^spec/(.+).rb$}) do |_m|
    'spec/bowling_2.rb'
    # "spec/#{m[1]}.rb"
  end
end
