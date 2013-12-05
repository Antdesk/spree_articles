class Spree::Admin::CategoriesController < Spree::Admin::ResourceController
  class Category < ActiveRecord::Base
  end

  layout :determine_layout


  def slug
    category = params[:category]
    params[:category][:slug] = params[:category][:name]
    @cat = Category.find(:last)
    @cat[:slug] = '/' + params[:category][:slug]
    @cat.save
  end

  def new
    @category = Spree::Category.new
    2.times do
      @category.spree_articles.build
    end
  end

  private

    def determine_layout
      case action_name
        when 'show'
          Spree::Config.layout
        else
          'spree/layouts/admin'
      end

    end

end
