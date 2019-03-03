class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]


  def index
    @items = Item.all
    # Ordem de mostrar 
    #render json: @items.order('valor DESC')
    render json: @items.order('quantidade DESC')
  end


  def show
    render json: @item
  end

 def create 
    item = Item.new item_params
  
    if item.save
       render json: item, status: :created and return

    elsif item.has_nil_fields 
          error_status = :bad_request 
    else  
             error_status = :unprocessable_entity
      end 
    render json: {message: 'Item não salvo', errors: item.errors}, status: error_status 
  end





 def update
    
      if @item.update(item_params)
           render json: @item, status: :ok and return 
        elsif @product.has_nil_fields
          error_status = :bad_request
        else 
          error_status = :unprocessable_entity       
        end 
     end




  def destroy 
     if @item.nil?
        render json: {message:"Item não encontrado"}
            
     else  
       @item.destroy
       render json: {message:"Item deletado com sucesso"}   
     end

  end

  private




    def set_item
      @item = Item.find(params[:id])
    end




    def item_params
      params.require(:item).permit(:nome, :quantidade, :valor)
    end
end
