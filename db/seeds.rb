# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Create Users
User.create(email: "magowan.ryan@gmail.com", password: "12345Test", password_confirmation: "12345Test", username: "RyanMmHmm", picture_url: "http://static1.squarespace.com/static/568ed94fa128e65d0d38c30e/t/568edd025a56685951bdbceb/1452303144979/rm-mono.png?format=500w")
User.create(email: 'no_activity@app.com', password: 'Temp123!', password_confirmation: 'Temp123!', username: 'Random', picture_url: 'http://img2-ak.lst.fm/i/u/64s/2291dfce5f5c4a05adb2f59dc597d0f5.jpg')
User.create(email: "contact@robholody.io", password: "asdfg", password_confirmation: "asdfg", username: "Rob", picture_url: "http://robholody.io/img/rob-head.png")
User.create(email: "scmwalsh@gmail.com", password: "larry", password_confirmation: "larry", username: "SCMWalsh", picture_url: "https://scontent-yyz1-1.xx.fbcdn.net/hphotos-frc3/v/t1.0-9/1978760_10153857569815008_1296979771_n.jpg?oh=83541e7d0a4bca3f4672ba08ec7f4b7a&oe=56FD106D")

@activity = Activity.create(title: "Meet Your Makers: Web & iOS Demos", description: "Looking for web or iOS development talent? Here's your chance to find it.", end_time: DateTime.now, location_title: "Bitmaker Labs" , location: "220 King St W, Suite 200, Toronto, ON M5H 1K4", picture_url: "http://i64.tinypic.com/f0ysgp.jpg")
@activity.owner = User.find(3)
@activity.save
@comment = @activity.comments.create(body: "These apps are amazing!")
@comment.user = User.last
@comment.save

@activity = Activity.create(title: "ZUMBA!", description: "Tired of the treadmill? Want to try something different? Looking to make new friends? Come join the Zumba party and dance the night away!", end_time: DateTime.tomorrow, location_title: "Fountain Blu", location: "200 Princes' Blvd, Toronto, ON M6K 3C3, Toronto, ON", picture_url: "http://i64.tinypic.com/2ljt8qe.jpg")
@activity.owner = User.first
@activity.save
@comment = @activity.comments.create(body: "This extremely fun dance based workout improves your cardiovascular system while toning your entire body.")
@comment.user = User.first
@comment.save

@activity = Activity.create(title: "Tuesday Turn-Up", description: "You've worked hard all day. Come relax and enjoy our amazing cocktails", end_time: DateTime.tomorrow, location_title:"Early Mercy", location: "540 King St W, Toronto, ON M5V 1M3", picture_url: "http://i66.tinypic.com/mb7n2o.jpg")
@activity.owner = User.last
@activity.save
@comment = @activity.comments.create(body: "The cool vibe and delicious cocktails make Early Mercy ideal for catching up with a friend or a fun night out.")
@comment.user = User.last
@comment.save

@activity = Activity.create(title: "Rock & Blues Foundations - Intermediate Drop-In Guitar Class", description: "Students will practice playing rhythm and lead guitar together, as well as alternating between both roles.", end_time: DateTime.tomorrow, location_title: "Mint Music", location: "116 Bond St, Toronto, ON M5B 1X8, Toronto, ON", picture_url: "http://i63.tinypic.com/o5oxhs.jpg")
@activity.owner = User.first
@activity.save
@acomment = @activity.comments.create(body: "Woah, I never thought this was going to be released!")
@comment.user = User.last
@comment.save
