class ProductsController < ApplicationController
  before_action :private_access, except: [:index, :show] #cada vez que se llame alguna de estas rutas va a ejecutar el metodo private_Access exceptuando index y show

  def index
  	@products = Product.all
  end

  def new
    @product = Product.new	
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "El producto fue publicado con éxito"	
    else
      render :new
    end
  end
  
  def show
    @product = Product.find(params[:id])  
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
       redirect_to products_path, notice: "El producto ha sido modificado con éxito"
    else 
       render :edit 
    end
  end

  def destroy
    product = Product.find(params[:id]) #No lleva @ porque no es necesario mostrar la variable en la vista
    product.destroy

    redirect_to products_path, notice: "El producto fue eliminado con éxito"
  end

  private
  	def product_params
  		params.required(:product).permit(:name, :url, :description)
  	end
end
