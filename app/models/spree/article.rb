class Spree::Article < ActiveRecord::Base
  belongs_to :spree_category, :class_name => 'Spree::Category'
  default_scope :order => 'created_at ASC'

  validates_presence_of :title
  validates_presence_of :content

  scope :visible, where(:visible => true)

  attr_accessible :title, :content, :visible

  def self.by_id(id)
    self.where(id: id)
  end

end