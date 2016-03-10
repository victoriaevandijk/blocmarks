require 'faker'

 15.times do
   Topic.create!(
     title: Faker::Lorem.word
   )
 end
 topics = Topic.all
 
 50.times do
   Bookmark.create!(
     topic:  topics.sample,
     url:  Faker::Internet.url,
   )
 end
 
puts "Seeds finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"