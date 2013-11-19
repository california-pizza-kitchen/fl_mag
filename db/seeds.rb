# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create({name: "Admin"})
ian = Blogger.create({name: "Ian Miller", feed_xml: "http://irmiller22.github.io/atom.xml", semester: 3})
ian.build_feed(:feed_xml => ian.feed_xml)
feed = ian.feed
feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedzirra_object.entries)
ian.feed.save

kyle = Blogger.create({name: "Kyle Shike", feed_xml: "http://kyleshike.github.io/atom.xml", semester: 3})
kyle.build_feed(:feed_xml => kyle.feed_xml)
feed = kyle.feed
feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedzirra_object.entries)
kyle.feed.save

john = Blogger.create({name: "John Richardson", feed_xml: "http://richardsonjm.github.io/atom.xml", semester: 3})
john.build_feed(:feed_xml => john.feed_xml)
feed = john.feed
feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedzirra_object.entries)
john.feed.save