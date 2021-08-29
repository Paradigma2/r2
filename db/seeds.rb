# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'yugi@gmail.com', password: 'secret', full_name: 'Yugi Muto')
User.create(email: 'kaiba@gmail.com', password: 'secret', full_name: 'Seto Kaiba')

JobAd.create(
    name: 'Junior iOS Developer',
    description: 'An iOS Developer who has technical knowledge in Git, XCode, Swift, MVVM, Cocoa Touch Framework',
    employer: 'Ingemark',
    email: ENV['TEST_MAIL'] || 'samarijum+ignore@gmail.com',
    category: 'iOS',
    valid_until: Date.current + 7.days,
    user: User.find_by_email('yugi@gmail.com')
)
JobAd.create(
    name: 'Senior DevOps',
    description: 'A DevOps Engineer should possess very good knowledge of the Linux operating system, understands command-line operations and file system',
    employer: 'Ingemark',
    email: ENV['TEST_MAIL'] || 'samarijum+ignore@gmail.com',
    category: 'DevOps',
    valid_until: Date.current - 2,
    user: User.find_by_email('yugi@gmail.com')
)
JobAd.create(
    name: 'Medior Java Developer',
    description: 'If you’re a Java developer and you have minimum of 3 years experience in working with Java',
    employer: 'Kaiba co.',
    email: ENV['TEST_MAIL'] || 'samarijum+ignore@gmail.com',
    category: 'Java',
    valid_until: Date.current + 1.month,
    user: User.find_by_email('kaiba@gmail.com')
)
