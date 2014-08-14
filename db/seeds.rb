# This file should contain all the record creation needed to seed the database with its default values. # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create({name: "admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin"})

ruby000 = SchoolSession.create({name: "Ruby 000", start_date: "2012-10-03"})
ruby001 = SchoolSession.create({name: "Ruby 001", start_date: "2013-02-04"})
ruby002 = SchoolSession.create({name: "Ruby 002", start_date: "2013-06-03"})
ruby003 = SchoolSession.create({name: "Ruby 003", start_date: "2013-09-23"})
ruby004 = SchoolSession.create({name: "Ruby 004", start_date: "2014-02-03"})
ruby005 = SchoolSession.create({name: "Ruby 005", start_date: "2014-06-02"})
ios000 = SchoolSession.create({name: "iOS 000", start_date: "2013-09-30"})
ios001 = SchoolSession.create({name: "iOS 001", start_date: "2014-02-03"})
ios002 = SchoolSession.create({name: "iOS 002", start_date: "2014-06-02"})
bk000 = SchoolSession.create({name: "Brooklyn 000", start_date: "2013-11-11"})
bk001 = SchoolSession.create({name: "Brooklyn 001", start_date: "2014-03-31"})


# Ruby000

puts "Generating Ruby000..."

aarons = Blogger.create(name: "Aaron Streiter", feed_url: "http://evening-thicket-7319.herokuapp.com/", semester: 0, school_session: ruby000)
aarons.build_feed(feed_xml: "http://evening-thicket-7319.herokuapp.com/atom.xml")
feed = aarons.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
aarons.feed.save

adamj = Blogger.create(name: "Adam Jonas", feed_url: "http://adamjonas.com/", semester: 0, school_session: ruby000)
adamj.build_feed(feed_xml: "http://adamjonas.com/atom.xml")
feed = adamj.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
adamj.feed.save

bradw = Blogger.create(name: "Brad Wheel", feed_url: "http://bwheel.herokuapp.com/", semester: 0, school_session: ruby000)
bradw.build_feed(feed_xml: "http://bwheel.herokuapp.com/atom.xml")
feed = bradw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
bradw.feed.save

corrinab = Blogger.create(name: "Corinna Brock", feed_url: "http://cjbrock.github.io/", semester: 0, school_session: ruby000)
corrinab.build_feed(feed_xml: "http://cjbrock.github.io/atom.xml")
feed = corrinab.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
corrinab.feed.save

davidbaker = Blogger.create(name: "David Baker", feed_url: "http://dbtvblog.herokuapp.com/", semester: 0, school_session: ruby000)
davidbaker.build_feed(feed_xml: "http://dbtvblog.herokuapp.com/atom.xml")
feed = davidbaker.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
davidbaker.feed.save

jackn = Blogger.create(name: "Jack Nolan", feed_url: "http://jacknolan.herokuapp.com/", semester: 0, school_session: ruby000)
jackn.build_feed(feed_xml: "http://jacknolan.herokuapp.com/atom.xml")
feed = jackn.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jackn.feed.save

jamesv = Blogger.create(name: "James Vanneman", feed_url: "http://jvans1.github.io/", semester: 0, school_session: ruby000)
jamesv.build_feed(feed_xml: "http://jvans1.github.io/atom.xml")
feed = jamesv.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jamesv.feed.save

josephjd = Blogger.create(name: "Joseph J. DeVenuta", feed_url: "http://j.venator.vc/", semester: 0, school_session: ruby000)
josephjd.build_feed(feed_xml: "http://j.venator.vc/feed/")
feed = josephjd.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
josephjd.feed.save

joshrowley = Blogger.create(name: "Josh Rowley", feed_url: "http://blog.jrowdev.com/", semester: 0, school_session: ruby000)
joshrowley.build_feed(feed_xml: "http://blog.jrowdev.com/atom.xml")
feed = joshrowley.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
joshrowley.feed.save

kevinc = Blogger.create(name: "Kevin Curtin", feed_url: "http://kjcurtin.com/", semester: 0, school_session: ruby000)
kevinc.build_feed(feed_xml: "http://kjcurtin.com/feed.xml")
feed = kevinc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kevinc.feed.save

kevinmcn = Blogger.create(name: "Kevin McNamee", feed_url: "http://kevmcnamee.com/", semester: 0, school_session: ruby000)
kevinmcn.build_feed(feed_xml: "http://kevmcnamee.com/atom.xml")
feed = kevinmcn.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kevinmcn.feed.save

lioy = Blogger.create(name: "Li Ouyang", feed_url: "http://styliii.com/", semester: 0, school_session: ruby000)
lioy.build_feed(feed_xml: "http://styliii.com/atom.xml")
feed = lioy.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
lioy.feed.save

mattsalerno = Blogger.create(name: "Matt Salerno", feed_url: "http://blog.seldomatt.com/", semester: 0, school_session: ruby000)
mattsalerno.build_feed(feed_xml: "http://blog.seldomatt.com/atom.xml")
feed = mattsalerno.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mattsalerno.feed.save

nikhilt = Blogger.create(name: "Nikhil Thomas", feed_url: "http://nikhils-thoughts.herokuapp.com/", semester: 0, school_session: ruby000)
nikhilt.build_feed(feed_xml: "http://nikhils-thoughts.herokuapp.com/atom.xml")
feed = nikhilt.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
nikhilt.feed.save

rexf = Blogger.create(name: "Rex Feng", feed_url: "http://www.rexfeng.com/blog/", semester: 0, school_session: ruby000)
rexf.build_feed(feed_xml: "http://www.rexfeng.com/blog/feed/")
feed = rexf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rexf.feed.save

stephenc = Blogger.create(name: "Stephen Chen", feed_url: "http://newcodeflow.herokuapp.com/", semester: 0, school_session: ruby000)
stephenc.build_feed(feed_xml: "http://newcodeflow.herokuapp.com/atom.xml")
feed = stephenc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stephenc.feed.save


# Ruby001

puts "Generating Ruby001..."

alexgorski = Blogger.create(name: "Alex Gorski", feed_url: "alexgorski.github.io/blog/", semester: 1, school_session: ruby001)
alexgorski.build_feed(feed_xml: "http://alexgorski.github.io/blog/atom.xml")
feed = alexgorski.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
alexgorski.feed.save

aab = Blogger.create(name: "Ana Asnes Becker", feed_url: "anabecker.tumblr.com", semester: 1, school_session: ruby001)
aab.build_feed(feed_xml: "http://anabecker.tumblr.com/rss")
feed = aab.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
aab.feed.save

andrewc = Blogger.create(name: "Andrew Callahan", feed_url: "andrewcallahan.tumblr.com", semester: 1, school_session: ruby001)
andrewc.build_feed(feed_xml: "http://andrewcallahan.tumblr.com/rss")
feed = andrewc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
andrewc.feed.save

christinac = Blogger.create(name: "Christina Chang", feed_url: "christinachang.github.io", semester: 1, school_session: ruby001)
christinac.build_feed(feed_xml: "http://christinachang.github.io/atom.xml")
feed = christinac.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christinac.feed.save

crystalc = Blogger.create(name: "Crystal Chang", feed_url: "acrystalc.github.io", semester: 1, school_session: ruby001)
crystalc.build_feed(feed_xml: "http://acrystalc.github.io/atom.xml")
feed = crystalc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
crystalc.feed.save

danielgantz = Blogger.create(name: "Daniel Gantz", feed_url: "firstgeneration.github.io", semester: 1, school_session: ruby001)
danielgantz.build_feed(feed_xml: "http://firstgeneration.github.io/atom.xml")
feed = danielgantz.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
danielgantz.feed.save

dannyo = Blogger.create(name: "Danny Olinsky", feed_url: "dolin.github.io", semester: 1, school_session: ruby001)
dannyo.build_feed(feed_xml: "http://dolin.github.io/atom.xml")
feed = dannyo.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
dannyo.feed.save

daveliu = Blogger.create(name: "Dave Liu", feed_url: "chickenriceplatter.github.io", semester: 1, school_session: ruby001)
daveliu.build_feed(feed_xml: "http://chickenriceplatter.github.io/atom.xml")
feed = daveliu.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
daveliu.feed.save

elh = Blogger.create(name: "Ei-Lene Heng", feed_url: "ei-lene.github.io", semester: 1, school_session: ruby001)
elh.build_feed(feed_xml: "http://ei-lene.github.io/atom.xml")
feed = elh.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
elh.feed.save

erici = Blogger.create(name: "Eric Iacutone", feed_url: "iacutone.github.io", semester: 1, school_session: ruby001)
erici.build_feed(feed_xml: "http://iacutone.github.io/atom.xml")
feed = erici.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
erici.feed.save

eugenew = Blogger.create(name: "Eugene Wang", feed_url: "eewang.github.io", semester: 1, school_session: ruby001)
eugenew.build_feed(feed_xml: "http://eewang.github.io/atom.xml")
feed = eugenew.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
eugenew.feed.save

harrisonw = Blogger.create(name: "Harrison Wang", feed_url: "hwang0214.github.io", semester: 1, school_session: ruby001)
harrisonw.build_feed(feed_xml: "http://hwang0214.github.io/atom.xml")
feed = harrisonw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
harrisonw.feed.save

janev = Blogger.create(name: "Jane Vora", feed_url: "janeeats.github.io", semester: 1, school_session: ruby001)
janev.build_feed(feed_xml: "http://janeeats.github.io/atom.xml")
feed = janev.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
janev.feed.save

justinkestler = Blogger.create(name: "Justin Kestler", feed_url: "meowist.github.io", semester: 1, school_session: ruby001)
justinkestler.build_feed(feed_xml: "http://meowist.github.io/atom.xml")
feed = justinkestler.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
justinkestler.feed.save

laurab = Blogger.create(name: "Laura Brown", feed_url: "1aurabrown.github.io", semester: 1, school_session: ruby001)
laurab.build_feed(feed_xml: "http://1aurabrown.github.io/atom.xml")
feed = laurab.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
laurab.feed.save

mashar = Blogger.create(name: "Masha Rikhter", feed_url: "mrikhter.github.io", semester: 1, school_session: ruby001)
mashar.build_feed(feed_xml: "http://mrikhter.github.io/atom.xml")
feed = mashar.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mashar.feed.save

rahuls = Blogger.create(name: "Rahul Seshan", feed_url: "rseshan.github.io", semester: 1, school_session: ruby001)
rahuls.build_feed(feed_xml: "http://rseshan.github.io/atom.xml")
feed = rahuls.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rahuls.feed.save

tylerd = Blogger.create(name: "Tyler Davis", feed_url: "tmd.io", semester: 1, school_session: ruby001)
tylerd.build_feed(feed_xml: "http://tmd.io/atom.xml")
feed = tylerd.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tylerd.feed.save

victoriaf = Blogger.create(name: "Victoria Friedman", feed_url: "vicfriedman.github.io", semester: 1, school_session: ruby001)
victoriaf.build_feed(feed_xml: "http://vicfriedman.github.io/atom.xml")
feed = victoriaf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
victoriaf.feed.save

wallisw = Blogger.create(name: "Wallis Wilkinson", feed_url: "Tsai walliswt.github.io", semester: 1, school_session: ruby001)
wallisw.build_feed(feed_xml: "http://walliswt.github.io/atom.xml")
feed = wallisw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
wallisw.feed.save


# Ruby002

puts "Generating Ruby002..."

adamw = Blogger.create(name:"Adam Waxman", feed_url: "http://awaxman11.github.io", semester: 2, school_session: ruby002)
adamw.build_feed(feed_xml: "http://awaxman11.github.io/atom.xml")
feed = adamw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
adamw.feed.save

alexa = Blogger.create(name:"Alex Au", feed_url: "http://surrealdetective.github.io", semester: 2, school_session: ruby002)
alexa.build_feed(feed_xml: "http://surrealdetective.github.io/atom.xml")
feed = alexa.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
alexa.feed.save

alisac = Blogger.create(name:"Alisa Chang", feed_url: "http://laptite.github.io", semester: 2, school_session: ruby002)
alisac.build_feed(feed_xml: "http://laptite.github.io/atom.xml")
feed = alisac.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
alisac.feed.save

anishav = Blogger.create(name:"Anisha Vasandani", feed_url: "nishconsumerism.com", semester: 2, school_session: ruby002)
anishav.build_feed(feed_xml: "http://nishconsumerism.com/feed/atom/")
feed = anishav.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
anishav.feed.save

chrisgonzales = Blogger.create(name:"Chris Gonzales", feed_url: "codercorral.com", semester: 2, school_session: ruby002)
chrisgonzales.build_feed(feed_xml: "http://codercorral.com/atom.xml")
feed = chrisgonzales.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrisgonzales.feed.save

christopherl = Blogger.create(name:"Christopher Lake", feed_url: "http://chhhris.github.io", semester: 2, school_session: ruby002)
christopherl.build_feed(feed_xml: "http://chhhris.github.io/atom.xml")
feed = christopherl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christopherl.feed.save

danielfriedman = Blogger.create(name:"Daniel Friedman", feed_url: "http://dfriedm.github.io", semester: 2, school_session: ruby002)
danielfriedman.build_feed(feed_xml: "http://dfriedm.github.io/atom.xml")
feed = danielfriedman.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
danielfriedman.feed.save

davidmanaster = Blogger.create(name:"David Manaster", feed_url: "blog.manaster.com", semester: 2, school_session: ruby002)
davidmanaster.build_feed(feed_xml: "http://blog.manaster.com/atom.xml")
feed = davidmanaster.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
davidmanaster.feed.save

davidrodriguez = Blogger.create(name:"David Rodriguez", feed_url: "http://rodriguezd.github.io/", semester: 2, school_session: ruby002)
davidrodriguez.build_feed(feed_xml: "http://rodriguezd.github.io/atom.xml")
feed = davidrodriguez.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
davidrodriguez.feed.save

desmondr = Blogger.create(name:"Desmond Rawls", feed_url: "http://desmondrawls.github.io", semester: 2, school_session: ruby002)
desmondr.build_feed(feed_xml: "http://desmondrawls.github.io/atom.xml")
feed = desmondr.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
desmondr.feed.save

georgel = Blogger.create(name:"George Lin", feed_url: "http://gglin.github.io", semester: 2, school_session: ruby002)
georgel.build_feed(feed_xml: "http://gglin.github.io/atom.xml")
feed = georgel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
georgel.feed.save

jene = Blogger.create(name:"Jen Eisenberg", feed_url: "jeneisenberg.com", semester: 2, school_session: ruby002)
jene.build_feed(feed_xml: "http://jeneisenberg.com/atom.xml")
feed = jene.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jene.feed.save

jordant = Blogger.create(name:"Jordán Trevino", feed_url: "http://jgtr.github.io", semester: 2, school_session: ruby002)
jordant.build_feed(feed_xml: "http://jgtr.github.io/atom.xml")
feed = jordant.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jordant.feed.save

josephg = Blogger.create(name:"Joseph Giralt", feed_url: "weatherlightus.tumblr.com", semester: 2, school_session: ruby002)
josephg.build_feed(feed_xml: "http://weatherlightus.tumblr.com/rss")
feed = josephg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
josephg.feed.save

katiebi = Blogger.create(name:"Katie Barry Ishibashi", feed_url: "http://katieishibashi.github.io", semester: 2, school_session: ruby002)
katiebi.build_feed(feed_xml: "http://katieishibashi.github.io/atom.xml")
feed = katiebi.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
katiebi.feed.save

kristenc = Blogger.create(name:"Kristen Curtis", feed_url: "http://picodegallo.github.io", semester: 2, school_session: ruby002)
kristenc.build_feed(feed_xml: "http://picodegallo.github.io/atom.xml")
feed = kristenc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kristenc.feed.save

matts = Blogger.create(name:"Matt Schmaus", feed_url: "http://mschmaus201.github.io", semester: 2, school_session: ruby002)
matts.build_feed(feed_xml: "http://mschmaus201.github.io/atom.xml")
feed = matts.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
matts.feed.save

maxj = Blogger.create(name:"Max Jacobson", feed_url: "http://www.hardscrabble.net/", semester: 2, school_session: ruby002)
maxj.build_feed(feed_xml: "http://www.hardscrabble.net/feed.xml")
feed = maxj.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
maxj.feed.save

mendelk = Blogger.create(name:"Mendel Kramer", feed_url: "http://mendelk.github.io", semester: 2, school_session: ruby002)
mendelk.build_feed(feed_xml: "http://mendelk.github.io/atom.xml")
feed = mendelk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mendelk.feed.save

ningy = Blogger.create(name:"Ning Yap", feed_url: "http://ningbit.github.io", semester: 2, school_session: ruby002)
ningy.build_feed(feed_xml: "http://ningbit.github.io/atom.xml")
feed = ningy.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ningy.feed.save

ruthien = Blogger.create(name:"Ruthie Nachmany", feed_url: "http://ruthienachmany.github.io", semester: 2, school_session: ruby002)
ruthien.build_feed(feed_xml: "http://ruthienachmany.github.io/atom.xml")
feed = ruthien.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ruthien.feed.save

sagars = Blogger.create(name:"Sagar Shah", feed_url: "http://sgrshah.github.io", semester: 2, school_session: ruby002)
sagars.build_feed(feed_xml: "http://sgrshah.github.io/atom.xml")
feed = sagars.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sagars.feed.save

sarahd = Blogger.create(name:"Sarah Duve", feed_url: "http://sarahduve.github.io", semester: 2, school_session: ruby002)
sarahd.build_feed(feed_xml: "http://sarahduve.github.io/atom.xml")
feed = sarahd.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sarahd.feed.save

stevenb = Blogger.create(name:"Steven Brooks", feed_url: "http://stevenabrooks.github.io", semester: 2, school_session: ruby002)
stevenb.build_feed(feed_xml: "http://stevenabrooks.github.io/atom.xml")
feed = stevenb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stevenb.feed.save

thomasd = Blogger.create(name:"Thomas Deatherage", feed_url: "http://deatheragetr.github.io", semester: 2, school_session: ruby002)
thomasd.build_feed(feed_xml: "http://deatheragetr.github.io/atom.xml")
feed = thomasd.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
thomasd.feed.save


# Ruby003

puts "Generating Ruby003..."

amanda = Blogger.create({name: "Amanda Himmelstoss", feed_url: "http://ahimmelstoss.github.io", semester: 3, twitter_handle: "@ahimmelstoss", school_session: ruby003})
amanda.build_feed(:feed_xml => "http://ahimmelstoss.github.io/atom.xml")
feed = amanda.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
amanda.feed.save

anders = Blogger.create({name: "Anders Ramsey", feed_url: "http://coderchronicles.org", semester: 3, twitter_handle: "@andersramsay", school_session: ruby003})
anders.build_feed(:feed_xml => "http://coderchronicles.org/rss")
feed = anders.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
anders.feed.save

bana = Blogger.create({name: "Bandana Malik", feed_url: "http://bandanakm.tumblr.com", semester: 3, twitter_handle: "@BandanaKM", school_session: ruby003})
bana.build_feed(:feed_xml => "http://bandanakm.tumblr.com/rss")
feed = bana.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
bana.feed.save

manley = Blogger.create({name: "Brendan Manley", feed_url: "http://manleyhimself.tumblr.com", school_session: ruby003})
manley.build_feed(:feed_xml => "http://manleyhimself.tumblr.com/rss")
feed = manley.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
manley.feed.save

charlotte = Blogger.create({name: "Charlotte Chang", feed_url: "http://glamouracademy.github.io", semester: 3, school_session: ruby003})
charlotte.build_feed(:feed_xml => "http://glamouracademy.github.io/atom.xml")
feed = charlotte.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
charlotte.feed.save

daniel = Blogger.create({name: "Daniel Chang", feed_url: "http://danielchangnyc.github.io", semester: 3, twitter_handle: "@danielchangNYC", school_session: ruby003})
daniel.build_feed(:feed_xml => "http://danielchangnyc.github.io/atom.xml")
feed = daniel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
daniel.feed.save

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

ian = Blogger.create({name: "Ian Miller", feed_url: "http://irmiller22.github.io", semester: 3, twitter_handle: "@irmiller22", school_session: ruby003})
ian.build_feed(:feed_xml => "http://irmiller22.github.io/atom.xml")
feed = ian.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
ian.feed.save

joe = Blogger.create({name: "Joe O'Conor", feed_url: "http://jnoconor.github.io", semester: 3, school_session: ruby003})
joe.build_feed(:feed_xml => "http://jnoconor.github.io/atom.xml")
feed = joe.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
joe.feed.save

john = Blogger.create({name: "John Richardson", feed_url: "http://richardsonjm.github.io", semester: 3, twitter_handle: "@richardsonjm", school_session: ruby003})
john.build_feed(:feed_xml => "http://richardsonjm.github.io/atom.xml")
feed = john.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
john.feed.save

kyle = Blogger.create({name: "Kyle Shike", feed_url: "http://kyleshike.github.io", semester: 3, twitter_handle: "@kyleshike", school_session: ruby003})
kyle.build_feed(:feed_xml => "http://kyleshike.github.io/atom.xml")
feed = kyle.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml) 
feed.add_entries(feedjira_object.entries)
kyle.feed.save

logan = Blogger.create({name: "Logan Hasson", feed_url: "http://loganhasson.github.io", semester: 3, twitter_handle: "@loganhasson", school_session: ruby003})
logan.build_feed(:feed_xml => "http://loganhasson.github.io/atom.xml")
feed = logan.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
logan.feed.save

manuel = Blogger.create({name: "Manuel Neuhauser", feed_url: "http://manu3569.github.io", semester: 3, school_session: ruby003})
manuel.build_feed(:feed_xml => "http://manu3569.github.io/atom.xml")
feed = manuel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
manuel.feed.save

margaret = Blogger.create({name: "Margaret Lee", feed_url: "http://margaretleedees2.github.io", semester: 3, twitter_handle: "@margeleedees2", school_session: ruby003})
margaret.build_feed(:feed_xml => "http://margaretleedees2.github.io/atom.xml")
feed = margaret.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
margaret.feed.save

matt = Blogger.create({name: "Matt Campbell", feed_url: "http://mecampbellsoup.github.io", semester: 3, twitter_handle: "@mecampbellsoup", school_session: ruby003})
matt.build_feed(:feed_xml => "http://mecampbellsoup.github.io/atom.xml")
feed = matt.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
matt.feed.save

michael = Blogger.create({name: "Michael Polycarpou", feed_url: "http://polycarpou.github.io", semester: 3, twitter_handle: "@", school_session: ruby003})
michael.build_feed(:feed_xml => "http://polycarpou.github.io/atom.xml")
feed = michael.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
michael.feed.save

ray = Blogger.create({name: "Raymond Gan", feed_url: "http://rayning0.github.io", semester: 3, twitter_handle: "@rgan0", school_session: ruby003})
ray.build_feed(:feed_xml => "http://rayning0.github.io/atom.xml")
feed = ray.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ray.feed.save

rosie = Blogger.create({name: "Rosie Hoyem", feed_url: "http://rosiehoyem.github.io", semester: 3, school_session: ruby003})
rosie.build_feed(:feed_xml => "http://rosiehoyem.github.io/atom.xml")
feed = rosie.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rosie.feed.save

sam_o = Blogger.create({name: "Samuel Owens", feed_url: "http://samueldowens.github.io", semester: 3, school_session: ruby003})
sam_o.build_feed(:feed_xml => "http://samueldowens.github.io/atom.xml")
feed = sam_o.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sam_o.feed.save

sam_y = Blogger.create({name: "Sam Yang", feed_url: "http://samyangblogs.tumblr.com", semester: 3, twitter_handle: "@SamuelDOwens", school_session: ruby003})
sam_y.build_feed(:feed_xml => "http://samyangblogs.tumblr.com/rss")
feed = sam_y.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sam_y.feed.save

sonja = Blogger.create({name: "Sonja Hall", feed_url: "http://sonejah21.github.io", semester: 3, twitter_handle: "@sonjahall", school_session: ruby003})
sonja.build_feed(:feed_xml => "http://sonejah21.github.io/atom.xml")
feed = sonja.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sonja.feed.save

stephanie = Blogger.create({name: "Stephanie Oh", feed_url: "http://stephaniehoh.github.io", semester: 3, twitter_handle: "@SostephOh", school_session: ruby003})
stephanie.build_feed(:feed_xml => "http://stephaniehoh.github.io/atom.xml")
feed = stephanie.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stephanie.feed.save

theo = Blogger.create({name: "Theo Vora", feed_url: "http://theevo.github.io", semester: 3, twitter_handle: "@theevo", school_session: ruby003})
theo.build_feed(:feed_xml => "http://theevo.github.io/atom.xml")
feed = theo.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
theo.feed.save

tiffany = Blogger.create({name: "Tiffany Peon", feed_url: "http://apeonlearnstoprogram.tumblr.com", semester: 3, twitter_handle: "@peontiffany", school_session: ruby003})
tiffany.build_feed(:feed_xml => "http://apeonlearnstoprogram.tumblr.com/rss")
feed = tiffany.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tiffany.feed.save

vinney = Blogger.create({name: "Vinney Cavallo", feed_url: "http://vcavallo.github.io", semester: 3, twitter_handle: "@vinneycavallo", school_session: ruby003})
vinney.build_feed(:feed_xml => "http://vcavallo.github.io/atom.xml")
feed = vinney.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
vinney.feed.save


# Ruby004

puts "Generating Ruby004..."

alisham = Blogger.create(name: "Alisha McWilliams", feed_url: "http://alishamcwilliams.wordpress.com/", semester: 4, school_session: ruby004)
alisham.build_feed(feed_xml: "http://alishamcwilliams.wordpress.com/feed/")
feed = alisham.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
alisham.feed.save

arielc = Blogger.create(name: "Ariel Caplan", feed_url: "http://amcaplan.wordpress.com/", semester: 4, school_session: ruby004)
arielc.build_feed(feed_xml: "http://amcaplan.wordpress.com/feed/")
feed = arielc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
arielc.feed.save

arielles = Blogger.create(name: "Arielle Sullivan", feed_url: "http://ariellesullivan.com/", semester: 4, school_session: ruby004)
arielles.build_feed(feed_xml: "http://ariellesullivan.com/feed")
feed = arielles.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
arielles.feed.save

boyoungk = Blogger.create(name: "Boyoung Kwon", feed_url: "http://boyoung.me", semester: 4, school_session: ruby004)
boyoungk.build_feed(feed_xml: "http://boyoung.me/feed")
feed = boyoungk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
boyoungk.feed.save

brianp = Blogger.create(name: "Brian Pisano", feed_url: "http://brianpisano.com/blog/", semester: 4, school_session: ruby004)
brianp.build_feed(feed_xml: "http://brianpisano.com/blog/feed")
feed = brianp.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
brianp.feed.save

chrisg = Blogger.create(name: "Chris Guthrie", feed_url: "http://caguthrie.github.io/", semester: 4, school_session: ruby004)
chrisg.build_feed(feed_xml: "http://caguthrie.github.io/atom.xml")
feed = chrisg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrisg.feed.save

chrisk = Blogger.create(name: "Chris Kohlbrenner", feed_url: "http://chriskohlbrenner.github.io/", semester: 4, school_session: ruby004)
chrisk.build_feed(feed_xml: "http://chriskohlbrenner.github.io/atom.xml")
feed = chrisk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrisk.feed.save

danielf = Blogger.create(name: "Daniel Fenjves", feed_url: "http://dfenjves.github.io/", semester: 4, school_session: ruby004)
danielf.build_feed(feed_xml: "http://dfenjves.github.io/atom.xml")
feed = danielf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
danielf.feed.save

danielk = Blogger.create(name: "Daniel Kronovet", feed_url: "http://kr0nos4piens.wordpress.com/", semester: 4, school_session: ruby004)
danielk.build_feed(feed_xml: "http://kr0nos4piens.wordpress.com/feed/")
feed = danielk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
danielk.feed.save

emmai = Blogger.create(name: "Emma Ife", feed_url: "http://ifeisshort.wordpress.com/", semester: 4, school_session: ruby004)
emmai.build_feed(feed_xml: "http://ifeisshort.wordpress.com/feed/")
feed = emmai.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
emmai.feed.save

erikp = Blogger.create(name: "Erik Peterson", feed_url: "http://eriksalgstrompeterson.tumblr.com", semester: 4, school_session: ruby004)
erikp.build_feed(feed_xml: "http://eriksalgstrompeterson.tumblr.com/rss")
feed = erikp.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
erikp.feed.save

eugenem = Blogger.create(name: "Eugene Millerman", feed_url: "http://eugmill.com/", semester: 4, school_session: ruby004)
eugenem.build_feed(feed_xml: "http://eugmill.com/atom.xml")
feed = eugenem.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
eugenem.feed.save

jisuk = Blogger.create(name: "Jisu Kim", feed_url: "http://jisukim82.github.io/", semester: 4, school_session: ruby004)
jisuk.build_feed(feed_xml: "http://jisukim82.github.io/atom.xml")
feed = jisuk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jisuk.feed.save

joans = Blogger.create(name: "Joan Soskin", feed_url: "http://joansoskin.wordpress.com/", semester: 4, school_session: ruby004)
joans.build_feed(feed_xml: "http://joansoskin.wordpress.com/feed/")
feed = joans.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
joans.feed.save

kevinc = Blogger.create(name: "Kevin Chang", feed_url: "http://fifthsurprise.wordpress.com/", semester: 4, school_session: ruby004)
kevinc.build_feed(feed_xml: "http://fifthsurprise.wordpress.com/feed/")
feed = kevinc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kevinc.feed.save

michaelp = Blogger.create(name: "Michael Prouty", feed_url: "http://mprouts.github.io/", semester: 4, school_session: ruby004)
michaelp.build_feed(feed_xml: "http://mprouts.github.io/atom.xml")
feed = michaelp.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
michaelp.feed.save

mikel = Blogger.create(name: "Mike Lerner", feed_url: "http://michaelbenjaminlerner.tumblr.com", semester: 4, school_session: ruby004)
mikel.build_feed(feed_xml: "http://michaelbenjaminlerner.tumblr.com/rss")
feed = mikel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mikel.feed.save

sams = Blogger.create(name: "Sam Schlinkert", feed_url: "http://sts10.github.io/", semester: 4, school_session: ruby004)
sams.build_feed(feed_xml: "http://sts10.github.io/atom.xml")
feed = sams.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sams.feed.save

stephaniec = Blogger.create(name: "Stephanie Chandra", feed_url: "http://trickortechrat.wordpress.com/", semester: 4, school_session: ruby004)
stephaniec.build_feed(feed_xml: "http://trickortechrat.wordpress.com/feed/")
feed = stephaniec.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stephaniec.feed.save

sushanthb = Blogger.create(name: "Sushanth Bhaskarabhatla", feed_url: "http://bhaskaraspb.wordpress.com/", semester: 4, school_session: ruby004)
sushanthb.build_feed(feed_xml: "http://bhaskaraspb.wordpress.com/feed/")
feed = sushanthb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sushanthb.feed.save

thomass = Blogger.create(name: "Thomas Surgent", feed_url: "http://surgentt.blogspot.com/", semester: 4, school_session: ruby004)
thomass.build_feed(feed_xml: "http://surgentt.blogspot.com/feeds/posts/default")
feed = thomass.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
thomass.feed.save

tristans = Blogger.create(name: "Tristian Siegel", feed_url: "http://tsiege.github.io/", semester: 4, school_session: ruby004)
tristans.build_feed(feed_xml: "http://tsiege.github.io/atom.xml")
feed = tristans.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tristans.feed.save

wontaey = Blogger.create(name: "Wontae Yang", feed_url: "https://wontaeyang.silvrback.com/", semester: 4, school_session: ruby004)
wontaey.build_feed(feed_xml: "https://wontaeyang.silvrback.com/feed/")
feed = wontaey.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
wontaey.feed.save


# Ruby005

puts "Generating Ruby005..."

adriennef = Blogger.create({name: "Adrienne Fishman", feed_url: "http://adriennefishman.blogspot.com/", semester: 5, school_session: ruby005})
adriennef.build_feed(:feed_xml => "http://adriennefishman.blogspot.com/feeds/posts/default")
feed = adriennef.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
adriennef.feed.save

ambert = Blogger.create({name: "Amber Tunnell", feed_url: "http://ambertunnell.github.io/", semester: 5, school_session: ruby005})
ambert.build_feed(:feed_xml => "http://ambertunnell.github.io/atom.xml")
feed = ambert.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ambert.feed.save

amyj = Blogger.create({name: "Amy Johnson", feed_url: "http://amyrjohnson.github.io/", semester: 5, school_session: ruby005})
amyj.build_feed(:feed_xml => "http://amyrjohnson.github.io/atom.xml")
feed = amyj.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
amyj.feed.save

ashleyb = Blogger.create({name: "Ashley Blewer", feed_url: "http://ablwr.github.io/", semester: 5, school_session: ruby005})
ashleyb.build_feed(:feed_xml => "http://ablwr.github.io/atom.xml")
feed = ashleyb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ashleyb.feed.save

bens = Blogger.create({name: "Ben Serviss", feed_url: "http://kamoh.github.io/", semester: 5, school_session: ruby005})
bens.build_feed(:feed_xml => "http://kamoh.github.io/atom.xml")
feed = bens.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
bens.feed.save

brandonh = Blogger.create({name: "Brandon Hopkins", feed_url: "http://bajh.github.io/", semester: 5, school_session: ruby005})
brandonh.build_feed(:feed_xml => "http://bajh.github.io/atom.xml")
feed = brandonh.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
brandonh.feed.save

cassidyp = Blogger.create({name: "Cassidy Pignatello", feed_url: "http://cassidypignatello.github.io/", semester: 5, school_session: ruby005})
cassidyp.build_feed(:feed_xml => "http://cassidypignatello.github.io/atom.xml")
feed = cassidyp.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
cassidyp.feed.save

ccmeyers = Blogger.create({name: "Catherine Meyers", feed_url: "http://anunexpectedcoder.com/", semester: 5, school_session: ruby005})
ccmeyers.build_feed(:feed_xml => "http://anunexpectedcoder.com/atom.xml")
feed = ccmeyers.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ccmeyers.feed.save

chrisc = Blogger.create({name: "Chris Callahan", feed_url: "http://callahanchris.github.io/", semester: 5, school_session: ruby005})
chrisc.build_feed(:feed_xml => "http://callahanchris.github.io/atom.xml")
feed = chrisc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrisc.feed.save

christinal = Blogger.create({name: "Christina Leuci", feed_url: "http://christinaleuci.github.io/", semester: 5, school_session: ruby005})
christinal.build_feed(:feed_xml => "http://christinaleuci.github.io/atom.xml")
feed = christinal.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christinal.feed.save

daniels = Blogger.create({name: "Daniel Sullivan", feed_url: "http://daniel-sullivan.com/", semester: 5, school_session: ruby005})
daniels.build_feed(:feed_xml => "http://daniel-sullivan.com/atom.xml")
feed = daniels.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
daniels.feed.save

denineg = Blogger.create({name: "Denine Guy", feed_url: "http://denineguy.github.io/", semester: 5, school_session: ruby005})
denineg.build_feed(:feed_xml => "http://denineguy.github.io/atom.xml")
feed = denineg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
denineg.feed.save

edwardw = Blogger.create({name: "Edward Warren", feed_url: "http://ewarren7.github.io/", semester: 5, school_session: ruby005})
edwardw.build_feed(:feed_xml => "http://ewarren7.github.io/atom.xml")
feed = edwardw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
edwardw.feed.save

emilyl = Blogger.create({name: "Emily Lowing", feed_url: "http://elowing.github.io/", semester: 5, school_session: ruby005})
emilyl.build_feed(:feed_xml => "http://elowing.github.io/atom.xml")
feed = emilyl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
emilyl.feed.save

ilanas = Blogger.create({name: "Ilana Sufrin", feed_url: "http://ilanaflatiron.tumblr.com/", semester: 5, school_session: ruby005})
ilanas.build_feed(:feed_xml => "http://ilanaflatiron.tumblr.com/rss")
feed = ilanas.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ilanas.feed.save

jacobb = Blogger.create({name: "Jacob Barrieault", feed_url: "http://jbarrieault.github.io/", semester: 5, school_session: ruby005})
jacobb.build_feed(:feed_xml => "http://jbarrieault.github.io/atom.xml")
feed = jacobb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jacobb.feed.save

jessicar = Blogger.create({name: "Jessica Rudder", feed_url: "http://jessrudder.github.io/", semester: 5, school_session: ruby005})
jessicar.build_feed(:feed_xml => "http://jessrudder.github.io/atom.xml")
feed = jessicar.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jessicar.feed.save

juliat = Blogger.create({name: "Julia Taitz", feed_url: "http://juliataitz.blogspot.com/", semester: 5, school_session: ruby005})
juliat.build_feed(:feed_xml => "http://juliataitz.blogspot.com/feeds/posts/default")
feed = juliat.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
juliat.feed.save

justink = Blogger.create({name: "Justin Kim", feed_url: "http://jusjmkim.github.io/", semester: 5, school_session: ruby005})
justink.build_feed(:feed_xml => "http://jusjmkim.github.io/atom.xml")
feed = justink.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
justink.feed.save

korenc = Blogger.create({name: "Koren Leslie Cohen", feed_url: "http://www.korenlc.com/blog/", semester: 5, school_session: ruby005})
korenc.build_feed(:feed_xml => "http://feeds.feedburner.com/korenlesliecohen")
feed = korenc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
korenc.feed.save

krisc = Blogger.create({name: "Kris Croes", feed_url: "http://kriscroes.github.io/", semester: 5, school_session: ruby005})
krisc.build_feed(:feed_xml => "http://kriscroes.github.io/atom.xml")
feed = krisc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
krisc.feed.save

kyled = Blogger.create({name: "Kyle Doherty", feed_url: "http://kylefdoherty.github.io/", semester: 5, school_session: ruby005})
kyled.build_feed(:feed_xml => "http://kylefdoherty.github.io/atom.xml")
feed = kyled.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kyled.feed.save

lizb = Blogger.create({name: "Liz Baillie", feed_url: "http://liz-baillie.tumblr.com/", semester: 5, school_session: ruby005})
lizb.build_feed(:feed_xml => "http://liz-baillie.tumblr.com/rss")
feed = lizb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
lizb.feed.save

luked = Blogger.create({name: "Luke Demarest", feed_url: "http://lukedemarest.com/blog1.html", semester: 5, school_session: ruby005})
luked.build_feed(:feed_xml => "http://lukedemarest.com/2/feed")
feed = luked.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
luked.feed.save

matthiasl = Blogger.create({name: "Matthias Loker", feed_url: "http://mmlkrx.github.io/", semester: 5, school_session: ruby005})
matthiasl.build_feed(:feed_xml => "http://mmlkrx.github.io/atom.xml")
feed = matthiasl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
matthiasl.feed.save

mitchb = Blogger.create({name: "Mitch Boyer", feed_url: "http://mrmitchboyer.github.io/", semester: 5, school_session: ruby005})
mitchb.build_feed(:feed_xml => "http://mrmitchboyer.github.io/atom.xml")
feed = mitchb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mitchb.feed.save

nataliea = Blogger.create({name: "Natalie Arellano", feed_url: "http://natalieparellano.github.io/", semester: 5, school_session: ruby005})
nataliea.build_feed(:feed_xml => "http://natalieparellano.github.io/atom.xml")
feed = nataliea.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
nataliea.feed.save

peterg = Blogger.create({name: "Peter Glennon", feed_url: "http://pcrglennon.github.io/", semester: 5, school_session: ruby005})
peterg.build_feed(:feed_xml => "http://pcrglennon.github.io/atom.xml")
feed = peterg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
peterg.feed.save

randallr = Blogger.create({name: "Randall Reed", feed_url: "http://randallreedjr.com/", semester: 5, school_session: ruby005})
randallr.build_feed(:feed_xml => "http://randallreedjr.com/atom.xml")
feed = randallr.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
randallr.feed.save

rebeccag = Blogger.create({name: "Rebecca Greenblatt", feed_url: "http://rebeccagreenblatt.github.io/", semester: 5, school_session: ruby005})
rebeccag.build_feed(:feed_xml => "http://rebeccagreenblatt.github.io/atom.xml")
feed = rebeccag.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rebeccag.feed.save

simons = Blogger.create({name: "Simon Seroussi", feed_url: "http://simonseroussi.github.io/", semester: 5, school_session: ruby005})
simons.build_feed(:feed_xml => "http://simonseroussi.github.io/atom.xml")
feed = simons.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
simons.feed.save

spencert = Blogger.create({name: "Spencer Tang", feed_url: "http://spencertang.github.io/", semester: 5, school_session: ruby005})
spencert.build_feed(:feed_xml => "http://spencertang.github.io/atom.xml")
feed = spencert.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
spencert.feed.save

vanessad = Blogger.create({name: "Vanessa Dean", feed_url: "http://vanessadean.github.io/", semester: 5, school_session: ruby005})
vanessad.build_feed(:feed_xml => "http://vanessadean.github.io/atom.xml")
feed = vanessad.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
vanessad.feed.save

willl = Blogger.create({name: "Will Lowry", feed_url: "http://wlowry88.github.io/", semester: 5, school_session: ruby005})
willl.build_feed(:feed_xml => "http://wlowry88.github.io/atom.xml")
feed = willl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
willl.feed.save

zacks = Blogger.create({name: "Zack Sheppard", feed_url: "http://io.zack.io/", semester: 5, school_session: ruby005})
zacks.build_feed(:feed_xml => "http://io.zack.io/atom.xml")
feed = zacks.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
zacks.feed.save


# IOS000

puts "Generating iOS000..."

basara = Blogger.create({name: "Basar Akyelli", feed_url: "http://bakyelli.wordpress.com/", semester: 0, school_session: ios000})
basara.build_feed(:feed_xml => "http://bakyelli.wordpress.com/feed/")
feed = basara.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
basara.feed.save

dasmers = Blogger.create({name: "Dasmer Singh", feed_url: "http://blog.dasmersingh.com/", semester: 0, school_session: ios000})
dasmers.build_feed(:feed_xml => "http://blog.dasmersingh.com/rss/")
feed = dasmers.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
dasmers.feed.save

duliod = Blogger.create({name: "Dulio Denis", feed_url: "http://cocoaallocinit.com/", semester: 0, school_session: ios000})
duliod.build_feed(:feed_xml => "http://cocoaallocinit.com/feed/")
feed = duliod.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
duliod.feed.save


# IOS001

puts "Generating iOS001..."

andream = Blogger.create(name: "Andrea McClave", feed_url: "http://acmcclave.wordpress.com/", semester: 1, school_session: ios001)
andream.build_feed(feed_xml: "http://acmcclave.wordpress.com/feed/")
feed = andream.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
andream.feed.save

annel = Blogger.create(name: "Anne Lindsley", feed_url: "http://annelindsley.wordpress.com/", semester: 1, school_session: ios001)
annel.build_feed(feed_xml: "http://annelindsley.wordpress.com/feed/")
feed = annel.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
annel.feed.save

danielg = Blogger.create(name: "Daniel Gallardo", feed_url: "http://dannygtech.wordpress.com/", semester: 1, school_session: ios001)
danielg.build_feed(feed_xml: "http://dannygtech.wordpress.com/feed/")
feed = danielg.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
danielg.feed.save

darer = Blogger.create(name: "Dare Ryan", feed_url: "http://daretryan.wordpress.com", semester: 1, school_session: ios001)
darer.build_feed(feed_xml: "http://daretryan.wordpress.com/feed/")
feed = darer.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
darer.feed.save

edanl = Blogger.create(name: "Edan Lichtenstein", feed_url: "http://ruckt.info/", semester: 1, school_session: ios001)
edanl.build_feed(feed_xml: "http://ruckt.info/feed/")
feed = edanl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
edanl.feed.save

elizabethc = Blogger.create(name: "Elizabeth Choy", feed_url: "http://lizzy808.wordpress.com/", semester: 1, school_session: ios001)
elizabethc.build_feed(feed_xml: "http://lizzy808.wordpress.com/feed")
feed = elizabethc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
elizabethc.feed.save

ezekiela = Blogger.create(name: "Ezekiel Abuhoff", feed_url: "http://baconthorpe.wordpress.com", semester: 1, school_session: ios001)
ezekiela.build_feed(feed_xml: "http://baconthorpe.wordpress.com/feed/")
feed = ezekiela.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ezekiela.feed.save

lucasc = Blogger.create(name: "Lucas Chwe", feed_url: "http://blog.lschwe.com/", semester: 1, school_session: ios001)
lucasc.build_feed(feed_xml: "http://blog.lschwe.com/feed/")
feed = lucasc.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
lucasc.feed.save

nadiay = Blogger.create(name: "Nadia Yudina", feed_url: "http://joystate.wordpress.com/", semester: 1, school_session: ios001)
nadiay.build_feed(feed_xml: "http://joystate.wordpress.com/feed/")
feed = nadiay.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
nadiay.feed.save


# IOS002

puts "Generating iOS002..."

albertl = Blogger.create({name: "Albert Lardizabal", feed_url: "http://albie.me/", semester: 2, school_session: ios002})
albertl.build_feed(:feed_xml => "http://albie.me/feed/")
feed = albertl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
albertl.feed.save

carterl = Blogger.create({name: "Carter Levin", feed_url: "http://clevin95.github.io/", semester: 2, school_session: ios002})
carterl.build_feed(:feed_xml => "http://clevin95.github.io/atom.xml")
feed = carterl.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
carterl.feed.save

heidih = Blogger.create({name: "Heidi Hansen", feed_url: "http://heidihansen.org/", semester: 2, school_session: ios002})
heidih.build_feed(:feed_xml => "http://heidihansen.org/atom.xml")
feed = heidih.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
heidih.feed.save

leor = Blogger.create({name: "Leo Reubelt", feed_url: "http://leoreubelt.wordpress.com/", semester: 2, school_session: ios002})
leor.build_feed(:feed_xml => "http://leoreubelt.wordpress.com/feed/")
feed = leor.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
leor.feed.save

marcuss = Blogger.create({name: "Marcus Smith", feed_url: "http://msmithers93blog.wordpress.com/", semester: 2, school_session: ios002})
marcuss.build_feed(:feed_xml => "http://msmithers93blog.wordpress.com/feed/")
feed = marcuss.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
marcuss.feed.save

matthews = Blogger.create({name: "Matthew Surowiec", feed_url: "http://www.boolshithappens.com/", semester: 2, school_session: ios002})
matthews.build_feed(:feed_xml => "http://www.boolshithappens.com/feed/")
feed = matthews.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
matthews.feed.save

michaelv = Blogger.create({name: "Michael Vilabrera", feed_url: "http://mvilabrera.wordpress.com/", semester: 2, school_session: ios002})
michaelv.build_feed(:feed_xml => "http://mvilabrera.wordpress.com/feed/")
feed = michaelv.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
michaelv.feed.save

stevez = Blogger.create({name: "Steve Zhou", feed_url: "http://stevezhou.me/", semester: 2, school_session: ios002})
stevez.build_feed(:feed_xml => "http://stevezhou.me/feed/")
feed = stevez.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stevez.feed.save

tarikf = Blogger.create({name: "Tarik Fayad", feed_url: "http://tarikfayad.com/", semester: 2, school_session: ios002})
tarikf.build_feed(:feed_xml => "http://tarikfayad.com/feed/")
feed = tarikf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tarikf.feed.save

troyb = Blogger.create({name: "Troy Barrett", feed_url: "http://tmull.blogspot.com/", semester: 2, school_session: ios002})
troyb.build_feed(:feed_xml => "http://tmull.blogspot.com/atom.xml")
feed = troyb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
troyb.feed.save

viktorf = Blogger.create({name: "Viktor Falkner", feed_url: "http://meetthefalkner.wordpress.com/", semester: 2, school_session: ios002})
viktorf.build_feed(:feed_xml => "http://meetthefalkner.wordpress.com/feed/")
feed = viktorf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
viktorf.feed.save

zacharyd = Blogger.create({name: "Zachary Drossman", feed_url: "http://zacharydrossman.com/", semester: 2, school_session: ios002})
zacharyd.build_feed(:feed_xml => "http://zacharydrossman.com/atom.xml")
feed = zacharyd.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
zacharyd.feed.save


# BK000

puts "Generating BK000..."

anishar = Blogger.create(name: "Anisha Ramnani", feed_url: "http://blurredcommandlines.tumblr.com/", semester: 0, school_session: bk000)
anishar.build_feed(feed_xml: "http://blurredcommandlines.tumblr.com/rss")
feed = anishar.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
anishar.feed.save

arieli = Blogger.create(name: "Ariel Isaacs", feed_url: "http://ajosepha.tumblr.com", semester: 0, school_session: bk000)
arieli.build_feed(feed_xml: "http://ajosepha.tumblr.com/rss")
feed = arieli.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
arieli.feed.save

armandoa = Blogger.create(name: "Armando Amador", feed_url: "http://mandoiscoding.tumblr.com/", semester: 0, school_session: bk000)
armandoa.build_feed(feed_xml: "http://mandoiscoding.tumblr.com/rss")
feed = armandoa.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
armandoa.feed.save

chrish = Blogger.create(name: "Chris Haack", feed_url: "http://chryus.wordpress.com/", semester: 0, school_session: bk000)
chrish.build_feed(feed_xml: "http://chryus.wordpress.com/feed/")
feed = chrish.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
chrish.feed.save

davidgabeau = Blogger.create(name: "David Gabeau", feed_url: "misfitsandtroublemakers.tumblr.com", semester: 0, school_session: bk000)
davidgabeau.build_feed(feed_xml: "http://misfitsandtroublemakers.tumblr.com/rss")
feed = davidgabeau.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
davidgabeau.feed.save

feliciao = Blogger.create(name: "Felicia O'Garro", feed_url: "http://fullimmersion.me/", semester: 0, school_session: bk000)
feliciao.build_feed(feed_xml: "http://fullimmersion.me/rss")
feed = feliciao.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
feliciao.feed.save

gustavog = Blogger.create(name: "Gustavo Guimaraes", feed_url: "http://gustavocguimaraes.wordpress.com/", semester: 0, school_session: bk000)
gustavog.build_feed(feed_xml: "http://gustavocguimaraes.wordpress.com/feed")
feed = gustavog.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
gustavog.feed.save

hannahn = Blogger.create(name: "Hannah Nordgren", feed_url: "www.anunorderedlistapart.tumblr.com", semester: 0, school_session: bk000)
hannahn.build_feed(feed_xml: "http://anunorderedlistapart.tumblr.com/rss#_=_")
feed = hannahn.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
hannahn.feed.save

jahmile = Blogger.create(name: "Jahmil Eady", feed_url: "http://seejahmilcode.tumblr.com/", semester: 0, school_session: bk000)
jahmile.build_feed(feed_xml: "http://seejahmilcode.tumblr.com/rss")
feed = jahmile.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jahmile.feed.save

kated = Blogger.create(name: "Kate Donahue", feed_url: "http://katedonahue.tumblr.com", semester: 0, school_session: bk000)
kated.build_feed(feed_xml: "http://katedonahue.tumblr.com/rss")
feed = kated.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
kated.feed.save

katieh = Blogger.create(name: "Katie Hoffman", feed_url: "http://flatironbk.tumblr.com", semester: 0, school_session: bk000)
katieh.build_feed(feed_xml: "http://flatironbk.tumblr.com/rss")
feed = katieh.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
katieh.feed.save

keithw = Blogger.create(name: "Keith Williams Jr.", feed_url: "codewardbound.tumblr.com", semester: 0, school_session: bk000)
keithw.build_feed(feed_xml: "http://codewardbound.tumblr.com/rss")
feed = keithw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
keithw.feed.save

keturahw = Blogger.create(name: "Keturah Walters", feed_url: "http://keturahwalters.tumblr.com/", semester: 0, school_session: bk000)
keturahw.build_feed(feed_xml: "http://keturahwalters.tumblr.com/rss")
feed = keturahw.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
keturahw.feed.save

nikkit = Blogger.create(name: "Nikki Thean", feed_url: "http://nikkicodes.tumblr.com/", semester: 0, school_session: bk000)
nikkit.build_feed(feed_xml: "http://nikkicodes.tumblr.com/rss")
feed = nikkit.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
nikkit.feed.save

nishab = Blogger.create(name: "Nisha Batra", feed_url: "http://nishacodes.tumblr.com/", semester: 0, school_session: bk000)
nishab.build_feed(feed_xml: "http://nishacodes.tumblr.com/rss")
feed = nishab.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
nishab.feed.save

olivers = Blogger.create(name: "Oliver Switzer", feed_url: "http://allyourcodesarebelongtous.tumblr.com", semester: 0, school_session: bk000)
olivers.build_feed(feed_xml: "http://allyourcodesarebelongtous.tumblr.com/rss")
feed = olivers.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
olivers.feed.save

poojap = Blogger.create(name: "Pooja Pasawala", feed_url: "http://poojawins.tumblr.com/", semester: 0, school_session: bk000)
poojap.build_feed(feed_xml: "http://poojawins.tumblr.com/rss")
feed = poojap.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
poojap.feed.save

sarag = Blogger.create(name: "Sara Gorecki", feed_url: "http://mykindofgeek.com", semester: 0, school_session: bk000)
sarag.build_feed(feed_xml: "http://mykindofgeek.com/feed")
feed = sarag.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sarag.feed.save

sarahr = Blogger.create(name: "Sarah Ransohoff", feed_url: "http://sarahunderstandsverylittle.tumblr.com", semester: 0, school_session: bk000)
sarahr.build_feed(feed_xml: "http://sarahunderstandsverylittle.tumblr.com/rss")
feed = sarahr.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sarahr.feed.save

seanr = Blogger.create(name: "Sean Reed", feed_url: "http://kittykaraoke.tumblr.com/", semester: 0, school_session: bk000)
seanr.build_feed(feed_xml: "http://kittykaraoke.tumblr.com/rss")
feed = seanr.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
seanr.feed.save

tessaf = Blogger.create(name: "Tessa Fallon", feed_url: "contessavarchar.tumblr.com/", semester: 0, school_session: bk000)
tessaf.build_feed(feed_xml: "http://contessavarchar.tumblr.com/rss")
feed = tessaf.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
tessaf.feed.save


# BK001

puts "Generating BK001..."

charlottet = Blogger.create(name: "Charlotte Tregelles", feed_url: "http://lottetreg.tumblr.com", semester: 1, school_session: bk001)
charlottet.build_feed(feed_xml: "http://lottetreg.tumblr.com/rss")
feed = charlottet.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
charlottet.feed.save

christinacannito = Blogger.create(name: "Christina Cannito", feed_url: "http://shelearnstocodeinbrooklyn.com/", semester: 1, school_session: bk001)
christinacannito.build_feed(feed_xml: "http://shelearnstocodeinbrooklyn.com/feed/")
feed = christinacannito.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christinacannito.feed.save

christineb = Blogger.create(name: "Christine Beaubrun", feed_url: "http://christinebeaubrun.tumblr.com", semester: 1, school_session: bk001)
christineb.build_feed(feed_xml: "http://christinebeaubrun.tumblr.com/rss")
feed = christineb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christineb.feed.save

christopherlehneis = Blogger.create(name: "Christopher Lehneis", feed_url: "http://syntaxchris.tumblr.com", semester: 1, school_session: bk001)
christopherlehneis.build_feed(feed_xml: "http://syntaxchris.tumblr.com/rss")
feed = christopherlehneis.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
christopherlehneis.feed.save

edwardj = Blogger.create(name: "Edward Jasper", feed_url: "http://codeandthecity.com/", semester: 1, school_session: bk001)
edwardj.build_feed(feed_xml: "http://codeandthecity.com/feed/")
feed = edwardj.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
edwardj.feed.save

emilysimonton = Blogger.create(name: "Emily Simonton", feed_url: "http://emilysimonton.tumblr.com", semester: 1, school_session: bk001)
emilysimonton.build_feed(feed_xml: "http://emilysimonton.tumblr.com/rss")
feed = emilysimonton.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
emilysimonton.feed.save

ericac = Blogger.create(name: "Erica Cheung", feed_url: "http://ericodes.wordpress.com/", semester: 1, school_session: bk001)
ericac.build_feed(feed_xml: "http://ericodes.wordpress.com/feed/")
feed = ericac.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
ericac.feed.save

georget = Blogger.create(name: "George Taveras", feed_url: "http://georgielovesoup.tumblr.com", semester: 1, school_session: bk001)
georget.build_feed(feed_xml: "http://georgielovesoup.tumblr.com/rss")
feed = georget.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
georget.feed.save

hannahkim = Blogger.create(name: "Hannah Kim", feed_url: "http://www.coderiffic.tumblr.com", semester: 1, school_session: bk001)
hannahkim.build_feed(feed_xml: "http://www.coderiffic.tumblr.com/rss")
feed = hannahkim.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
hannahkim.feed.save

jdb = Blogger.create(name: "Janel diBiccari", feed_url: "http://syntacticsugarhouse.tumblr.com", semester: 1, school_session: bk001)
jdb.build_feed(feed_xml: "http://syntacticsugarhouse.tumblr.com/rss")
feed = jdb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
jdb.feed.save

joshualieberman = Blogger.create(name: "Joshua Lieberman", feed_url: "http://blog.joshua.tl/", semester: 1, school_session: bk001)
joshualieberman.build_feed(feed_xml: "http://blog.joshua.tl/atom.xml")
feed = joshualieberman.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
joshualieberman.feed.save

katherineb = Blogger.create(name: "Katherine Brender", feed_url: "http://rsoph.tumblr.com", semester: 1, school_session: bk001)
katherineb.build_feed(feed_xml: "http://rsoph.tumblr.com/rss")
feed = katherineb.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
katherineb.feed.save

mandyy = Blogger.create(name: "Mandy Yeung", feed_url: "http://www.mandyyeung.com/blog", semester: 1, school_session: bk001)
mandyy.build_feed(feed_xml: "http://mandyyeung.com/blog/feed")
feed = mandyy.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mandyy.feed.save

mendys = Blogger.create(name: "Mendy Seldowitz", feed_url: "http://Mendyismy.name", semester: 1, school_session: bk001)
mendys.build_feed(feed_xml: "http://mendyismyname.tumblr.com/rss")
feed = mendys.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
mendys.feed.save

natachas = Blogger.create(name: "Natacha Springer", feed_url: "http://natachaspringer.tumblr.com", semester: 1, school_session: bk001)
natachas.build_feed(feed_xml: "http://natachaspringer.tumblr.com/rss")
feed = natachas.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
natachas.feed.save

rebeccap = Blogger.create(name: "Rebecca Poulson", feed_url: "http://rpoulson.tumblr.com", semester: 1, school_session: bk001)
rebeccap.build_feed(feed_xml: "http://rpoulson.tumblr.com/rss")
feed = rebeccap.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
rebeccap.feed.save

roberth = Blogger.create(name: "Robert Horrigan", feed_url: "http://rob-on-rails.com", semester: 1, school_session: bk001)
roberth.build_feed(feed_xml: "http://rob-on-rails.com/feed/")
feed = roberth.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
roberth.feed.save

samerk = Blogger.create(name: "Samer Khaleel", feed_url: "http://rubyboard.wordpress.com/", semester: 1, school_session: bk001)
samerk.build_feed(feed_xml: "http://rubyboard.wordpress.com/feed/")
feed = samerk.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
samerk.feed.save

sharniei = Blogger.create(name: "Sharnie Ivery", feed_url: "http://brooklynrails.com", semester: 1, school_session: bk001)
sharniei.build_feed(feed_xml: "http://brooklynrails.com/feed/")
feed = sharniei.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
sharniei.feed.save

stephaniec = Blogger.create(name: "Stephanie Coleman", feed_url: "http://codingmultitudes.tumblr.com", semester: 1, school_session: bk001)
stephaniec.build_feed(feed_xml: "http://codingmultitudes.tumblr.com/rss")
feed = stephaniec.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stephaniec.feed.save

stevenn = Blogger.create(name: "Steven Nunez", feed_url: "http://hostiledeveloper.com", semester: 1, school_session: bk001)
stevenn.build_feed(feed_xml: "http://hostiledeveloper.com/feed")
feed = stevenn.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
stevenn.feed.save

yaritzar = Blogger.create(name: "Yaritza Rodriguez", feed_url: "http://yaritzarodriguez-nyc.tumblr.com", semester: 1, school_session: bk001)
yaritzar.build_feed(feed_xml: "http://yaritzarodriguez-nyc.tumblr.com/rss")
feed = yaritzar.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
yaritzar.feed.save

yonatanm = Blogger.create({name: "Yonatan Miller", feed_url: "http://yolocomet.tumblr.com", semester: 1, school_session: bk001})
yonatanm.build_feed(:feed_xml => "http://yolocomet.tumblr.com/rss")
feed = yonatanm.feed
feedjira_object = Feedjira::Feed.fetch_and_parse(feed.feed_xml)
feed.add_entries(feedjira_object.entries)
yonatanm.feed.save



Blogger.all.each_with_index do |blogger, i|
  # blogger.update( school_session: ruby003) if i%2 == 0
  # blogger.update( school_session: ios000) if i%2 != 0

  blogger.feed.entries.each do |entry|
    entry.assign_school_session
  end
end

