class Spree::ShowarticlesController < Spree::StoreController

  helper "spree/products"
  layout :determine_layout

  def show
    id = params[:id]
    @a = Spree::Article.by_id(id).first
    @b = Spree::Category.find(@a.spree_category_id).name
    @c = { :a => @a, :b => @b }
    if !(@a.nil? and @b.nil?)
      @c
    end
    #unless @a = Spree::Article.by_id(id).first
    #  render_404
    #end

  end

  private

  def determine_layout
    Spree::Config.layout
  end

  def accurate_title
    @a.title
  end

end
