User.create! do |user|
  user.full_name             = 'Peter Jones'
  user.email                 = 'pjones@pmade.com'
  user.password              = 'foobar'
  user.password_confirmation = 'foobar'
end

Category.create!(title: 'Business')
Category.create!(title: 'Personal')
Category.create!(title: 'Lady Gaga')
Category.create!(title: 'Short Pants')
Category.create!(title: 'Major Problem')
