
/entries

entries: [
  slug: "foo",
  slug: "foo-2"
]

/entries/:entry_slug

entry: {
  title: "foo",
  summary: "bar",
  ...,
  blogger: {
    name: "fudge",
    slug: "fudge"
  }
}

/entries/bloggers

bloggers: [
  slug: "fudge",
  slug: "fudge-2"
]

/bloggers/:blogger_slug

blogger: {
  name: "fudge",
  entries: [
    slug: "abc",
    slug: "def"
  ]
}

TODO: routing with school_session as top-level resource

i.e /school_session/:session/bloggers/:blogger_slug