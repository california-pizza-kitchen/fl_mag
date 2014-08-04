
/entries

[
  entries.each do |entry|
    entry.to_json
  end
]

/entries/:entry_slug

{
  title: entry.title,
  url: entry.url,
  content: entry.content.html_safe,
  schoolSession: entry.session_slug,
  tags: [
    entry.tags.each do |tag|
      {
        name: tag.display_word_or_word,
        url: "#{ENV['ROOT_URL']}/tags/#{tag.slug}"
      }
    end
  ],
  blogger: {
    name: entry.blogger.name,
    url: "#{ENV['ROOT_URL']}/bloggers/#{entry.blogger.slug}"
  }
}

/bloggers

bloggers: [
  bloggers.each do |blogger|
    blogger.to_json
  end
]

/bloggers/:blogger_slug

{
  name: blogger.name,
  numberOfEntries: blogger.entries.length,
  feedUrl: blogger.feed_url,
  schoolSession: entry.school_session_slug_or_placeholder,
  entries: [
    blogger.entries.each do |entry|
      {
        title: entry.title,
        slug: entry.slug,
        publishedDate:  entry.published,
        url: entry.url,
        summary: entry.summarize.html_safe,
        tags: [
          entry.tags.each do |tag|
            {
              name: tag.display_word_or_word,
              url: "#{ENV['ROOT_URL']}/tags/#{tag.slug}"
            }
          end
        ]
      }
    end
  ]
}

TODO: routing with school_session as top-level resource

i.e /school_session/:session/bloggers/:blogger_slug