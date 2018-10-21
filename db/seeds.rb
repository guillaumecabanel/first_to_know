print 'Seeds'

User.destroy_all
print '.'
Category.destroy_all
print '.'

User.create!(
  email: 'user@example.com',
  password: 'password'
)
print '.'

categories = [
  ['Ameublement', '19'],
  ['Immobilier', '13']
]

categories.each do |category|
  Category.create!(
    title: category[0],
    lbc_id: category[1]
  )
  print '.'
end

puts 'OK'
