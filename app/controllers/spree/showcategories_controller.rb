class Spree::ShowcategoriesController < Spree::StoreController

  helper "spree/products"
  layout :determine_layout

  def show
    path = case params[:path]
             when Array
               params[:path].join("/")
             when String
               params[:path]
             when nil
               request.path
           end
    unless @category = Spree::Category.by_slug(path).first
      render_404
    end
  end

  def show2
    path = case params[:path]
             when Array
               params[:path].join("/")
             when String
               params[:path]
             when nil
               request.path
           end
    unless @category = Spree::Category.by_slug2(path).first
      render_404
    end
  end

  private

  def determine_layout

        Spree::Config.layout



  end

  def accurate_title
    @category.name
  end

end
