# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Create Users
User.create(email: "test@test.com", password: "12345Test", password_confirmation: "12345Test", username: "anon", picture_url: "http://www.torontomike.com/images/blog/starwars.gif")
User.create(email: 'no_activity', password: 'Temp123!', password_confirmation: 'Temp123!', username: 'no_activity', picture_url: 'http://img2.wikia.nocookie.net/__cb20120417200552/beyblade/images/2/21/Forever_alone_icon_by_projectendo-d2zlt6v.jpg')
User.create(email: "asdf", password: "asdfg", password_confirmation: "asdfg", username: "anonimus", picture_url: "https://pbs.twimg.com/profile_images/1125323984/darthvader_normal.jpg")

@activity = Activity.create(title: "Custom Fanstasy Trading Application Day", description: "Matt, Andrew, Tyler & Alon present their amazing project where you can plan fantasy, and make stock trades, and do them both at the same time, wubadubadubdub.", end_time: Date.tomorrow, location: "220 King St W, Suite 200, Toronto, ON M5H 1K4", picture_url: "http://hd-report.com/wp-content/uploads/2014/09/espn-fantasy-football-app-logo-sq.jpg")
@activity.owner = User.first
@activity.save
@comment = @activity.comments.create(body: "I'm going to win this league of Traders.")
@comment.user = User.last
@comment.save

@activity = Activity.create(title: "Star Wars Movie Premiere: Always Tomorrow", description: "Dew, dew dew dew dew DEWWWWW DEW dew dew dew DEWWWWWW DEW dew dew dew DEWWWW!", end_time: Date.tomorrow, location: "259 Richmond St W, Toronto, ON M5V 3M6", picture_url: "http://pixel.nymag.com/imgs/daily/vulture/2015/10/18/18-star-wars-poster.w529.h529.jpg")
@activity.owner = User.last
@activity.save
@comment = @activity.comments.create(body: "I can't wait to see this movie.")
@comment.user = User.first
@comment.save

