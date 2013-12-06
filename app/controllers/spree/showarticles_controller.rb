class Spree::ShowarticlesController < Spree::StoreController

  helper "spree/products"
  layout :determine_layout

  def show
    id = params[:id]
    render :json => params and return
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
