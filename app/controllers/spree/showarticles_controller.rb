class Spree::ShowarticlesController < Spree::StoreController

  helper "spree/products"
  layout :determine_layout

  def show
    id = params[:id]
    @a = Spree::Article.by_id(id).first
    @b = @a.spree_category_id
    c = { :a => @a, :b => @b }
    render :json => c and return
    unless @a = Spree::Article.by_id(id).first
      render_404
    end

  end

  private

  def determine_layout
    Spree::Config.layout
  end

  def accurate_title
    @a.title
  end

end
