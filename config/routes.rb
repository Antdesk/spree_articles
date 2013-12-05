module ArticlePage
  def self.remove_spree_mount_point(path)
    regex = Regexp.new '\A' + Rails.application.routes.url_helpers.spree_path
    path.sub( regex, '').split('?')[0]
  end
end

class Spree::ArticlePage
  def self.matches?(request)
    slug = ArticlePage::remove_spree_mount_point(request.fullpath)
    pages = Spree::Category.arel_table
    Spree::Category.by_slug(slug).exists?
  end
end

class Spree::ArticlePage2
  def self.matches?(request)
    slug = ArticlePage::remove_spree_mount_point(request.fullpath)
    pages = Spree::Category.arel_table
    Spree::Category.by_slug2(slug).exists?
  end
end

class Spree::ArticleRoot
  def self.matches?(request)
    path = ArticlePage::remove_spree_mount_point(request.fullpath)
    path.nil? && Spree::Category.by_slug(path.to_s).first
  end
end

class Spree::NewsPage
  def self.matches?(request)
    id = ArticlePage::remove_spree_mount_point(request.fullpath)
    id = id.split("/")[1]
    Spree::Article.by_id(id).exists?
  end
end


Spree::Core::Engine.routes.prepend do

  namespace :admin do
    resources :categories
    resources :articles
  end

  constraints(Spree::NewsPage) do
    match '/article/*id', :to => 'showarticles#show', :via => :get
  end

  constraints(Spree::ArticleRoot) do
    match '/', :to => 'showcategories#show', :via => :get

  end

  constraints(Spree::ArticlePage) do
    match '/*path', :to => 'showcategories#show', :via => :get
  end

  constraints(Spree::ArticlePage2) do
    match '/*path', :to => 'showcategories#show2', :via => :get
  end

end