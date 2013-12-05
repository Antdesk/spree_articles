Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "articles_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(Spree.t('categories_content.categories'),:url => '/admin/categories', :icon => 'icon-file') %>",
                     :disabled => false)