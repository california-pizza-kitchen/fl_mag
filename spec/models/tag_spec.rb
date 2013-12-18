require 'spec_helper'

describe Tag do
  before :each do
    @tag = Tag.create word: "YO"
  end

  it "makes a slug" do
    expect(@tag.slug).to eq "yo"
  end

  it "displays an edited word when it has one" do
    @tag.display_word = "hello there"
    expect(@tag.display_word_or_word).to eq "hello there"
  end

  it "displays word when it has no display word" do
    expect(@tag.display_word_or_word).to eq "YO"
  end
end