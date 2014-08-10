# This file should contain all the record creation needed to seed the database with its default values. # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create({name: "admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin"})

ruby003 = SchoolSession.create({name: "Ruby 003", start_date: "2013-09-23"})
ios000 = SchoolSession.create({name: "iOS 000", start_date: "2013-09-30"})
ruby005 = SchoolSession.create({name: "Ruby 005", start_date: "2014-06-02"})
ios002 = SchoolSession.create({name: "iOS 002", start_date: "2014-06-02"})
bk001 = SchoolSession.create({name: "Brooklyn 001", start_date: "2014-06-02"})

ian = Blogger.create({name: "Ian Miller", feed_url: "http://irmiller22.github.io", semester: 3, twitter_handle: "@irmiller22", school_session: ruby003})
ian.build_feed(:feed_xml => "http://irmiller22.github.io/atom.xml")
feed = ian.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
ian.feed.save

kyle = Blogger.create({name: "Kyle Shike", feed_url: "http://kyleshike.github.io", semester: 3, twitter_handle: "@kyleshike", school_session: ruby003})
kyle.build_feed(:feed_xml => "http://kyleshike.github.io/atom.xml")
feed = kyle.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
kyle.feed.save


john = Blogger.create({name: "John Richardson", feed_url: "http://richardsonjm.github.io", semester: 3, twitter_handle: "@richardsonjm", school_session: ios000})
john.build_feed(:feed_xml => "http://richardsonjm.github.io/atom.xml")
feed = john.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
john.feed.save

charlotte = Blogger.create({name: "Charlotte Chang", feed_url: "http://glamouracademy.github.io", semester: 3, school_session: ruby003})
charlotte.build_feed(:feed_xml => "http://glamouracademy.github.io/atom.xml")
feed = charlotte.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
charlotte.feed.save

tiffany = Blogger.create({name: "Tiffany Peon", feed_url: "http://apeonlearnstoprogram.tumblr.com", semester: 3, twitter_handle: "@peontiffany", school_session: ios000})
tiffany.build_feed(:feed_xml => "http://apeonlearnstoprogram.tumblr.com/rss")
feed = tiffany.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tiffany.feed.save

michael = Blogger.create({name: "Michael Polycarpou", feed_url: "http://polycarpou.github.io", semester: 3, twitter_handle: "@", school_session: ios000})
michael.build_feed(:feed_xml => "http://polycarpou.github.io/atom.xml")
feed = michael.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
michael.feed.save

amanda = Blogger.create({name: "Amanda Himmelstoss", feed_url: "http://ahimmelstoss.github.io", semester: 3, twitter_handle: "@ahimmelstoss", school_session: ruby003})
amanda.build_feed(:feed_xml => "http://ahimmelstoss.github.io/atom.xml")
feed = amanda.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
amanda.feed.save

emily = Blogger.create({name: "Emily Xie", feed_url: "http://emilyxxie.github.io", semester: 3, school_session: ruby003})
emily.build_feed(:feed_xml => "http://emilyxxie.github.io/atom.xml")
feed = emily.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
emily.feed.save

greg = Blogger.create({name: "Greg Eng", feed_url: "http://gregeng.github.io", semester: 3, school_session: ruby003})
greg.build_feed(:feed_xml => "http://gregeng.github.io/atom.xml")
feed = greg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
greg.feed.save

joe = Blogger.create({name: "Joe O'Conor", feed_url: "http://jnoconor.github.io", semester: 3, school_session: ruby003})
joe.build_feed(:feed_xml => "http://jnoconor.github.io/atom.xml")
feed = joe.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
joe.feed.save

sam_o = Blogger.create({name: "Samuel Owens", feed_url: "http://samueldowens.github.io", semester: 3, school_session: ruby003})
sam_o.build_feed(:feed_xml => "http://samueldowens.github.io/atom.xml")
feed = sam_o.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sam_o.feed.save

manuel = Blogger.create({name: "Manuel Neuhauser", feed_url: "http://manu3569.github.io", semester: 3, school_session: ios000})
manuel.build_feed(:feed_xml => "http://manu3569.github.io/atom.xml")
feed = manuel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
manuel.feed.save

manley = Blogger.create({name: "Brendan Manley", feed_url: "http://manleyhimself.tumblr.com", school_session: ios000})
manley.build_feed(:feed_xml => "http://manleyhimself.tumblr.com/rss")
feed = manley.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
manley.feed.save

ray = Blogger.create({name: "Raymond Gan", feed_url: "http://rayning0.github.io", semester: 3, twitter_handle: "@rgan0", school_session: ios000})
ray.build_feed(:feed_xml => "http://rayning0.github.io/atom.xml")
feed = ray.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ray.feed.save

# NoMethodError: undefined method `entries' for 403:Fixnum
# saron = Blogger.create({name: "Saron Yitbarek", feed_url: "http://bloggytoons.com", semester: 3, twitter_handle: "@saronyitbarek"})
# saron.build_feed(:feed_xml => "http://bloggytoons.com/posts?format=rss")
# feed = saron.feed
# feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedjira_object.entries)
# saron.feed.save

stephanie = Blogger.create({name: "Stephanie Oh", feed_url: "http://stephaniehoh.github.io", semester: 3, twitter_handle: "@SostephOh", school_session: ios000})
stephanie.build_feed(:feed_xml => "http://stephaniehoh.github.io/atom.xml")
feed = stephanie.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stephanie.feed.save

sam_y = Blogger.create({name: "Sam yang", feed_url: "http://samyangblogs.tumblr.com", semester: 3, twitter_handle: "@SamuelDOwens", school_session: ios000})
sam_y.build_feed(:feed_xml => "http://samyangblogs.tumblr.com/rss")
feed = sam_y.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sam_y.feed.save

logan = Blogger.create({name: "Logan Hasson", feed_url: "http://loganhasson.github.io", semester: 3, twitter_handle: "@loganhasson", school_session: ruby003})
logan.build_feed(:feed_xml => "http://loganhasson.github.io/atom.xml")
feed = logan.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
logan.feed.save

daniel = Blogger.create({name: "Daniel Chang", feed_url: "http://danielchangnyc.github.io", semester: 3, twitter_handle: "@danielchangNYC", school_session: ruby003})
daniel.build_feed(:feed_xml => "http://danielchangnyc.github.io/atom.xml")
feed = daniel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
daniel.feed.save

vinney = Blogger.create({name: "Vinney Cavallo", feed_url: "http://vcavallo.github.io", semester: 3, twitter_handle: "@vinneycavallo", school_session: ruby003})
vinney.build_feed(:feed_xml => "http://vcavallo.github.io/atom.xml")
feed = vinney.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
vinney.feed.save

theo = Blogger.create({name: "Theo Vora", feed_url: "http://theevo.github.io", semester: 3, twitter_handle: "@theevo", school_session: ruby003})
theo.build_feed(:feed_xml => "http://theevo.github.io/atom.xml")
feed = theo.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
theo.feed.save

# RSS/XML feed no longer exists
# chris = Blogger.create({name: "Christopher Lee", feed_url: "http://clee681.github.io", semester: 3})
# chris.build_feed(:feed_xml => "http://clee681.github.io/atom.xml")
# feed = chris.feed
# feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedjira_object.entries)
# chris.feed.save

# RSS/XML feed no longer exists
# trevor = Blogger.create({name: "Trevor McKendrick", feed_url: "http://trevormckendrick.com", semester: 3})
# trevor.build_feed(:feed_xml => "http://www.trevormckendrick.com/feed/")
# feed = trevor.feed
# feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedjira_object.entries)
# trevor.feed.save

rosie = Blogger.create({name: "Rosie Hoyem", feed_url: "http://rosiehoyem.github.io", semester: 3, school_session: ruby003})
rosie.build_feed(:feed_xml => "http://rosiehoyem.github.io/atom.xml")
feed = rosie.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rosie.feed.save

margaret = Blogger.create({name: "Margaret Lee", feed_url: "http://margaretleedees2.github.io", semester: 3, twitter_handle: "@margeleedees2", school_session: ios000})
margaret.build_feed(:feed_xml => "http://margaretleedees2.github.io/atom.xml")
feed = margaret.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
margaret.feed.save

bana = Blogger.create({name: "Bandana Malik", feed_url: "http://bandanakm.tumblr.com", semester: 3, twitter_handle: "@BandanaKM", school_session: ruby003})
bana.build_feed(:feed_xml => "http://bandanakm.tumblr.com/rss")
feed = bana.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
bana.feed.save

sonja = Blogger.create({name: "Sonja Hall", feed_url: "http://sonejah21.github.io", semester: 3, twitter_handle: "@sonjahall", school_session: ruby003})
sonja.build_feed(:feed_xml => "http://sonejah21.github.io/atom.xml")
feed = sonja.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sonja.feed.save

anders = Blogger.create({name: "Anders Ramsey", feed_url: "http://coderchronicles.org", semester: 3, twitter_handle: "@andersramsay", school_session: ruby003})
anders.build_feed(:feed_xml => "http://coderchronicles.org/rss")
feed = anders.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
anders.feed.save

matt = Blogger.create({name: "Matt Campbell", feed_url: "http://mecampbellsoup.github.io", semester: 3, twitter_handle: "@mecampbellsoup", school_session: ruby003})
matt.build_feed(:feed_xml => "http://mecampbellsoup.github.io/atom.xml")
feed = matt.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
matt.feed.save

# Blog no longer exists
# edina = Blogger.create({name: "Edina Vath", feed_url: "http://edinavath.github.io", semester: 3, twitter_handle: "@EdinaVath"})
# edina.build_feed(:feed_xml => "http://edinavath.github.io/atom.xml")
# feed = edina.feed
# feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
# feed.add_entries(feedjira_object.entries)
# edina.feed.save

peterg = Blogger.create({name: "Peter Glennon", feed_url: "http://pcrglennon.github.io/", semester: 5, school_session: ruby005})
peterg.build_feed(:feed_xml => "http://pcrglennon.github.io/atom.xml")
feed = peterg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
peterg.feed.save

chrisc = Blogger.create({name: "Chris Callahan", feed_url: "http://callahanchris.github.io/", semester: 5, school_session: ruby005})
chrisc.build_feed(:feed_xml => "http://callahanchris.github.io/atom.xml")
feed = chrisc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrisc.feed.save

yonatanm = Blogger.create({name: "Yonatan Miller", feed_url: "http://yolocomet.tumblr.com", semester: 1, school_session: bk001})
yonatanm.build_feed(:feed_xml => "http://yolocomet.tumblr.com/rss")
feed = yonatanm.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
yonatanm.feed.save

justink = Blogger.create({name: "Justin Kim", feed_url: "http://jusjmkim.github.io/", semester: 5, school_session: ruby005})
justink.build_feed(:feed_xml => "http://jusjmkim.github.io/atom.xml")
feed = justink.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
justink.feed.save

christinal = Blogger.create({name: "Christina Leuci", feed_url: "http://christinaleuci.github.io/", semester: 5, school_session: ruby005})
christinal.build_feed(:feed_xml => "http://christinaleuci.github.io/atom.xml")
feed = christinal.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christinal.feed.save

jessicar = Blogger.create({name: "Jessica Rudder", feed_url: "http://jessrudder.github.io/", semester: 5, school_session: ruby005})
jessicar.build_feed(:feed_xml => "http://jessrudder.github.io/atom.xml")
feed = jessicar.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jessicar.feed.save

ilanas = Blogger.create({name: "Ilana Sufrin", feed_url: "http://ilanaflatiron.tumblr.com/", semester: 5, school_session: ruby005})
ilanas.build_feed(:feed_xml => "http://ilanaflatiron.tumblr.com/rss")
feed = ilanas.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ilanas.feed.save

bens = Blogger.create({name: "Ben Serviss", feed_url: "http://kamoh.github.io/", semester: 5, school_session: ruby005})
bens.build_feed(:feed_xml => "http://kamoh.github.io/atom.xml")
feed = bens.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
bens.feed.save

zacks = Blogger.create({name: "Zack Sheppard", feed_url: "http://io.zack.io/", semester: 5, school_session: ruby005})
zacks.build_feed(:feed_xml => "http://io.zack.io/atom.xml")
feed = zacks.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
zacks.feed.save

viktorf = Blogger.create({name: "Viktor Falkner", feed_url: "http://meetthefalkner.wordpress.com/", semester: 2, school_session: ios002})
viktorf.build_feed(:feed_xml => "http://meetthefalkner.wordpress.com/feed/")
feed = viktorf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
viktorf.feed.save

heidih = Blogger.create({name: "Heidi Hansen", feed_url: "http://heidihansen.org/", semester: 2, school_session: ios002})
heidih.build_feed(:feed_xml => "http://heidihansen.org/atom.xml")
feed = heidih.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
heidih.feed.save

stevez = Blogger.create({name: "Steve Zhou", feed_url: "http://stevezhou.me/", semester: 2, school_session: ios002})
stevez.build_feed(:feed_xml => "http://stevezhou.me/feed/")
feed = stevez.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stevez.feed.save

lizb = Blogger.create({name: "Liz Baillie", feed_url: "http://liz-baillie.tumblr.com/", semester: 5, school_session: ruby005})
lizb.build_feed(:feed_xml => "http://liz-baillie.tumblr.com/rss")
feed = lizb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
lizb.feed.save

ashleyb = Blogger.create({name: "Ashley Blewer", feed_url: "http://ablwr.github.io/", semester: 5, school_session: ruby005})
ashleyb.build_feed(:feed_xml => "http://ablwr.github.io/atom.xml")
feed = ashleyb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ashleyb.feed.save

michaell = Blogger.create({name: "Michael Loker", feed_url: "http://mmlkrx.github.io/", semester: 5, school_session: ruby005})
michaell.build_feed(:feed_xml => "http://mmlkrx.github.io/atom.xml")
feed = michaell.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
michaell.feed.save


Blogger.all.each_with_index do |blogger, i|
  # blogger.update( school_session: ruby003) if i%2 == 0
  # blogger.update( school_session: ios000) if i%2 != 0

  blogger.feed.entries.each do |entry|
    entry.assign_school_session
  end
end

