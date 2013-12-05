class PrefixCategoriesTableName < ActiveRecord::Migration
  def change
    if table_exists?(:categories)
      rename_table :categories, :spree_categories
    end
  end
end


