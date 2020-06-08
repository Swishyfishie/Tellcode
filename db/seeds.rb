# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.create(youtube_link:"Www.youtube.com/1212", codewars_link:"www.codewars.com/314123", article_link:"www.dev.to/er324xx", question:"Why is coding hard?")
Card.create(youtube_link:"Www.youtube.com/1424", codewars_link:"www.codewars.com/3456yhb", article_link:"www.dev.to/ac432y", question:"Why is coding hard?")
Card.create(youtube_link:"Www.youtube.com/5436", codewars_link:"www.codewars.com/c3256guy", article_link:"www.dev.to/casdfr44", question:"Why is coding hard?")
Card.create(youtube_link:"Www.youtube.com/71245", codewars_link:"www.codewars.com/k9895565", article_link:"www.dev.to/casdgj", question:"Why is coding hard?")

Day.create(comment:"What a great first day")

User.create(username:"swishyfishie",  date_started:"1-1-1991", password: "1234")
User.create(username:"swishyfishie2", date_started:"1-1-1953", password: "1234")
User.create(username:"swishyfishie3", date_started:"1-40-1561", password: "1234")