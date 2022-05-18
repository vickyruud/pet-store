class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products 
  def index
    @products = Product.where(deleted_at: nil);
  end

  # GET /products/1 
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products 
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1 
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 soft delete
  def destroy
    @product.update(deleted_at: Time.now, delete_comment:params[:product][:delete_comment] )

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully deleted." }
      format.json { head :no_content }
    end
  end

 

  #show soft deleted products
  def show_deleted
    @products = Product.where.not(deleted_at: nil);
    
  end

  #undelete product
  def undelete
    puts "here"
    @product = Product.find(params[:id])
    @product.update(deleted_at: nil)
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully restored." }
      format.json { head :no_content }
    end
  
  end

  def add_delete_comment_form
    puts 'here', params[:delete_comment]
    @product = Product.find(params[:id])
  end

  private
    # find product and set it as the active one
    def set_product
      @product = Product.find(params[:id])
    end

    # accept product params
    def product_params
      params.require(:product).permit(:name, :price, :image_url, :description)
    end
end
