#encoding: utf-8
class Spree::Category < ActiveRecord::Base
  has_many :spree_articles, :dependent => :destroy, :class_name => 'Spree::Article', :foreign_key => 'spree_category_id'
  accepts_nested_attributes_for :spree_articles, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  default_scope :order => 'created_at ASC'

  validates_presence_of :name, :slug

  attr_accessible :name, :slug , :spree_articles_attributes

  def initialize(*args)
    super(*args)

  end

  def self.by_slug(slug)
    slug = ArticlePage::remove_spree_mount_point(slug)
    articles = self.arel_table
    query = articles[:slug].eq(slug).or(articles[:slug].eq("/#{slug}")).and(articles[:name].not_eq("Tillgängliga köpställen"))
    self.where(query)
  end

  def self.by_slug2(slug)
    slug = ArticlePage::remove_spree_mount_point(slug)
    articles = self.arel_table
    query = articles[:slug].eq(slug).or(articles[:slug].eq("/#{slug}")).and(articles[:name].eq("Tillgängliga köpställen"))
    self.where(query)
  end

  def link
    if slug.nil?
      return ''
    end
    slug
  end
end