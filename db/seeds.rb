# This file should contain all the record creation needed to seed the database with its default values. # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create({name: "admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin"})

ian = Blogger.create({name: "Ian Miller", feed_url: "http://irmiller22.github.io", semester: 3})
ian.build_feed(:feed_xml => "http://irmiller22.github.io/atom.xml")
feed = ian.feed
feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedzirra_object.entries)
ian.feed.save

# kyle = Blogger.create({name: "Kyle Shike", feed_url: "http://kyleshike.github.io", semester: 3})
# kyle.build_feed(:feed_xml => "http://kyleshike.github.io/atom.xml")
# feed = kyle.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
# feed.add_entries(feedzirra_object.entries)
# kyle.feed.save

# john = Blogger.create({name: "John Richardson", feed_url: "http://richardsonjm.github.io", semester: 3})
# john.build_feed(:feed_xml => "http://richardsonjm.github.io/atom.xml")
# feed = john.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml) 
# feed.add_entries(feedzirra_object.entries)
# john.feed.save

# charlotte = Blogger.create({name: "Charlotte Chang", feed_url: "http://glamouracademy.github.io", semester: 3})
# charlotte.build_feed(:feed_xml => "http://glamouracademy.github.io/atom.xml")
# feed = charlotte.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# charlotte.feed.save

# tiffany = Blogger.create({name: "Tiffany Peon", feed_url: "http://apeonlearnstoprogram.tumblr.com", semester: 3})
# tiffany.build_feed(:feed_xml => "http://apeonlearnstoprogram.tumblr.com/rss")
# feed = tiffany.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# tiffany.feed.save

# michael = Blogger.create({name: "Michael Polycarpou", feed_url: "http://polycarpou.github.io", semester: 3})
# michael.build_feed(:feed_xml => "http://polycarpou.github.io/atom.xml")
# feed = michael.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# michael.feed.save

# amanda = Blogger.create({name: "Amanda Himmelstoss", feed_url: "http://ahimmelstoss.github.io", semester: 3})
# amanda.build_feed(:feed_xml => "http://ahimmelstoss.github.io/atom.xml")
# feed = amanda.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# amanda.feed.save

# emily = Blogger.create({name: "Emily Xie", feed_url: "http://emilyxxie.github.io", semester: 3})
# emily.build_feed(:feed_xml => "http://emilyxxie.github.io/atom.xml")
# feed = emily.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# emily.feed.save

# greg = Blogger.create({name: "Greg Eng", feed_url: "http://gregeng.github.io", semester: 3})
# greg.build_feed(:feed_xml => "http://gregeng.github.io/atom.xml")
# feed = greg.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# greg.feed.save

# joe = Blogger.create({name: "Joe O'Conor", feed_url: "http://jnoconor.github.io", semester: 3})
# joe.build_feed(:feed_xml => "http://jnoconor.github.io/atom.xml")
# feed = joe.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# joe.feed.save

# sam_o = Blogger.create({name: "Samuel Owens", feed_url: "http://samueldowens.github.io", semester: 3})
# sam_o.build_feed(:feed_xml => "http://samueldowens.github.io/atom.xml")
# feed = sam_o.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# sam_o.feed.save

# manuel = Blogger.create({name: "Manuel Neuhauser", feed_url: "http://manu3569.github.io", semester: 3})
# manuel.build_feed(:feed_xml => "http://manu3569.github.io/atom.xml")
# feed = manuel.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# manuel.feed.save

# manley = Blogger.create({name: "Brendan Manley", feed_url: "http://manleyhimself.tumblr.com"})
# manley.build_feed(:feed_xml => "http://manleyhimself.tumblr.com/rss")
# feed = manley.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# manley.feed.save

# ray = Blogger.create({name: "Raymond Gan", feed_url: "http://rayning0.github.io", semester: 3})
# ray.build_feed(:feed_xml => "http://rayning0.github.io/atom.xml")
# feed = ray.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# ray.feed.save

# saron = Blogger.create({name: "Saron Yitbarek", feed_url: "http://bloggytoons.com", semester: 3})
# saron.build_feed(:feed_xml => "http://bloggytoons.com/home?format=rss")
# feed = saron.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# saron.feed.save

# stephanie = Blogger.create({name: "Stephanie Oh", feed_url: "http://stephaniehoh.github.io", semester: 3})
# stephanie.build_feed(:feed_xml => "http://stephaniehoh.github.io/atom.xml")
# feed = stephanie.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# stephanie.feed.save

# sam_y = Blogger.create({name: "Sam yang", feed_url: "http://samyangblogs.tumblr.com", semester: 3})
# sam_y.build_feed(:feed_xml => "http://samyangblogs.tumblr.com/rss")
# feed = sam_y.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# sam_y.feed.save

# logan = Blogger.create({name: "Logan Hasson", feed_url: "http://loganhasson.github.io", semester: 3})
# logan.build_feed(:feed_xml => "http://loganhasson.github.io/atom.xml")
# feed = logan.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# logan.feed.save

# daniel = Blogger.create({name: "Daniel Chang", feed_url: "http://danielchangnyc.github.io", semester: 3})
# daniel.build_feed(:feed_xml => "http://danielchangnyc.github.io/atom.xml")
# feed = daniel.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# daniel.feed.save

# vinney = Blogger.create({name: "Vinney Cavallo", feed_url: "http://vcavallo.github.io", semester: 3})
# vinney.build_feed(:feed_xml => "http://vcavallo.github.io/atom.xml")
# feed = vinney.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# vinney.feed.save

# theo = Blogger.create({name: "Theo Vora", feed_url: "http://theevo.github.io", semester: 3})
# theo.build_feed(:feed_xml => "http://theevo.github.io/atom.xml")
# feed = theo.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# theo.feed.save

# chris = Blogger.create({name: "Christopher Lee", feed_url: "http://clee681.github.io", semester: 3})
# chris.build_feed(:feed_xml => "http://clee681.github.io/atom.xml")
# feed = chris.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# chris.feed.save

# trevor = Blogger.create({name: "Trevor McKendrick", feed_url: "http://trevormckendrick.com", semester: 3})
# trevor.build_feed(:feed_xml => "http://www.trevormckendrick.com/feed/")
# feed = trevor.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# trevor.feed.save

# rosie = Blogger.create({name: "Rosie Hoyem", feed_url: "http://rosiehoyem.github.io", semester: 3})
# rosie.build_feed(:feed_xml => "http://rosiehoyem.github.io/atom.xml")
# feed = rosie.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# rosie.feed.save

# margaret = Blogger.create({name: "Margaret Lee", feed_url: "http://margaretleedees2.github.io", semester: 3})
# margaret.build_feed(:feed_xml => "http://margaretleedees2.github.io/atom.xml")
# feed = margaret.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# margaret.feed.save

# bana = Blogger.create({name: "Bandana Malik", feed_url: "http://bandanakm.tumblr.com", semester: 3})
# bana.build_feed(:feed_xml => "http://bandanakm.tumblr.com/rss")
# feed = bana.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# bana.feed.save

# sonja = Blogger.create({name: "Sonja Hall", feed_url: "http://sonejah21.github.io", semester: 3})
# sonja.build_feed(:feed_xml => "http://sonejah21.github.io/atom.xml")
# feed = sonja.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# sonja.feed.save

# anders = Blogger.create({name: "Anders Ramsey", feed_url: "http://coderchronicles.org", semester: 3})
# anders.build_feed(:feed_xml => "http://coderchronicles.org/rss")
# feed = anders.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# anders.feed.save

# matt = Blogger.create({name: "Matt Campbell", feed_url: "http://mecampbellsoup.github.io", semester: 3})
# matt.build_feed(:feed_xml => "http://mecampbellsoup.github.io/atom.xml")
# feed = matt.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# matt.feed.save

# edina = Blogger.create({name: "Edina Vath", feed_url: "http://edinavath.github.io"})
# edina.build_feed(:feed_xml => "http://edinavath.github.io/atom.xml")
# feed = edina.feed
# feedzirra_object = Feedzirra::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedzirra_object.entries)
# edina.feed.save




