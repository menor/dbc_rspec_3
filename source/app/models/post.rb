class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title, :slug_title

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def slug_title
    string_to_slug = title.downcase.gsub!(/[^a-z0-9]/) {'-'}.chomp('-')
    self.slug = string_to_slug
  end

end