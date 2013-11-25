class Tag < ActiveRecord::Base
  has_many :entries_tags


=begin
a new column in tags table "display name" 
- editable by admin in simple crud page
- if tag has display name, use is,
  otherwise display the name it came with

- allow for an admin to create tags
  - dropdown list to add a tag

=end
end