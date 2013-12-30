require 'spec_helper'

describe Tag do
  before :each do
    @tag = create(:tag)
  end

  it "makes a slug" do
    expect(@tag.slug).to eq @tag.word.downcase.gsub(" ","-").gsub(".","-")
  end

  it "displays an edited word when it has one" do
    @tag.display_word = "hello there"
    expect(@tag.display_word_or_word).to eq "hello there"
  end

  it "displays word when it has no display word" do
    expect(@tag.display_word_or_word).to eq @tag.word
  end
end