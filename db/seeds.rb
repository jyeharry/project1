User.destroy_all
u1 = User.create :email => 'jyeharry21@hotmail.com', :password => 'chicken', :first_name => 'Jye', :last_name => 'Harry', :admin => true
puts "#{User.count} users"

Bar.destroy_all
b1 = Bar.create :name => 'The Glenferrie Hotel', :address => "324 Burwood Rd, Hawthorn VIC 3122, Australia", :phone => "(03) 9818 6530", :city => "Hawthorn", :image => 'https://lh3.googleusercontent.com/p/AF1QipO52ZzzJ8ojyPr30aF46UTYk1WzdkQncsirfh2i=s1600-w800', :link => "http://www.glenferriehotel.com.au/", :bar_id => "ChIJq3jN3jNC1moR737X-_IgQls"
b2 = Bar.create :name => "Revolver Upstairs", :address => "229 Chapel St, Prahran VIC 3181, Australia", :phone => "(03) 9521 5985", :city => "Prahran", :image => 'https://lh3.googleusercontent.com/p/AF1QipMpaCmi9M4GjUPpHAoArTxmEETm73ni50IM1NQK=s1600-w800', :link => "http://revolverupstairs.com.au/", :bar_id => "ChIJ41lATiVo1moRzmbzZaaIcPE"
puts "#{Bar.count} bars"

u1.bars << b2
puts "#{u1.first_name}'s favourite bar is #{u1.bars.first.name}"
