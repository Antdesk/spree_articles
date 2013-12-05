class PrefixArticlesTableName < ActiveRecord::Migration
  def change
    if table_exists?(:articles)
      rename_table :articles, :spree_articles
    end
  end
end
