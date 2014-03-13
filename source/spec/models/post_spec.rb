require 'spec_helper'

describe Post do
  let(:post) { Post.new(title: "New post!", content: "A great story" )}

  it "title should be automatically titleized before save" do
    post.title.should eq "New post!"
    post.save
    
    post.title.should eq "New Post!"
  end

  it "post should be unpublished by default" do
    pending
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
