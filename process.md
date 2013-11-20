USER PROCESS

- admin adds a blogger by url
  - blogger saved to database
    - columns: name, xml_address, semester
  - background job rss parser saves each blog post in database
    - columns: title, body, blogger_id, date updated



IN THE BACKEND:

  THE PARSER
    - makes call to get xml data from all feeds
    - xml_simple gem turns xml data to ruby hash
    - make blog instance for each entry
    - save to database


  THE SIDEKICK (ever hour)
    - calls parser on the xml data



THE DATABSE:
  - bloggers table
    - name, xml address, semester
  - posts table
    - title, body, blogger_id
  - users table
    - name

Questions:
  - where should the xml_parsing happen (in the file structure?)
  - how to not over-extend the parser for every student, and only sift through data that has been changed?
    - github api- triggered callbacks, but what about other blog platforms?
      - convention in the future... students must post to <name>.github.io...

    - another way for now??
  - where will the will the main index be controlled?

  Down the line a bit: 
    - searches?
    - tags?
    - xml parsing for other blog platforms: tumblr, etc
Things to do
  - xml parse
  - user authenification
  - VIEWS
    - main index
    - individual student
    - individual blog
    - about?


THINGS TO DO:

- background update job
- admin authentication 
---- validate form data
- postgres + deployment

- more views for admin section


- jquery + css polishing
  - moblie friend


WISHLIST:

- text or email digest (subscriptions)
- frontend heavylifting
  - bigslide implementation