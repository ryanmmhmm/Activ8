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

@activity = Activity.create(title: "Bitmaker Demo-day NOW!", description: "Lets go Team Gibson.", end_time: DateTime.now, location_title: "Bitmaker Labs" , location: "220 King St W, Suite 200, Toronto, ON M5H 1K4", picture_url: "http://blog.bitmakerlabs.com/content/images/2015/09/blog-logo.png")
@activity.owner = User.find(3)
@activity.save
@comment = @activity.comments.create(body: "These apps are amazing!")
@comment.user = User.last
@comment.save

@activity = Activity.create(title: "Star Wars Movie Premiere: Always Tomorrow", description: "Jar Jar Binks is a Sith Lord.", end_time: DateTime.tomorrow, location_title: "Scotiabank Theatre", location: "259 Richmond St W, Toronto, ON M5V 3M6", picture_url: "http://pixel.nymag.com/imgs/daily/vulture/2015/10/18/18-star-wars-poster.w529.h529.jpg")
@activity.owner = User.first
@activity.save
@comment = @activity.comments.create(body: "I can't wait to see this movie.")
@comment.user = User.first
@comment.save

@activity = Activity.create(title: "Watch the Jays lose in the playoffs :(", description: "Joey Bat Flip.", end_time: DateTime.tomorrow, location_title:"SkyDome", location: "1 Blue Jays Way, Toronto, ON M5V 1J1", picture_url: "http://www.blogto.com/upload/2011/11/20111119-blue-jays-better.jpg")
@activity.owner = User.last
@activity.save

@comment = @activity.comments.create(body: "Take me out to the ball game,
Take me out with the crowd;
Just buy me some peanuts and Cracker Jack,
I don't care if I never get back.
Let me root, root, root for the home team,
If they don't win, it's a shame.
For it's one, two, three strikes, you're out,
At the old ball game.")
@comment.user = User.last
@comment.save

@activity = Activity.create(title: "New Battletoads just released.", description: "Call: (416) 861-9521 to pre-order your copy.", end_time: DateTime.tomorrow, location_title: "Gamestop (EB Games)" location: "199 Bay St C-134, Toronto, ON M5L 1E7", picture_url: "https://upload.wikimedia.org/wikipedia/en/d/df/Battletoads_in_Battlemaniacs.png")
@activity.owner = User.first
@activity.save
@acomment = @activity.comments.create(body: "Woah, I never thought this was going to be released!")
@comment.user = User.last
@comment.save
