class InventoryStoreItemsController < ApplicationController

 def index_store_item
  @storeitems = InventoryStoreItem.all
  @batches ||= Batch.all.includes(:course)
  @claims = Claim.all
 end

 def load_item_data
   @storeitem = InventoryStoreItem.find_by_id(params[:charstype]).present? ? InventoryStoreItem.find(params[:charstype]) : InventoryStoreItem.unscoped.find_by_id(params[:charstype])
   render :text => [@storeitem.remainig_qty || ""]
 end

 def main_page
 end

 def view_all_item
   @storeitems = InventoryStoreItem.all
 end

 def add_new_store_item
   @storeitems = InventoryStoreItem.all
   @batches ||= Batch.all
 end

 def index
   @storeitems ||= InventoryStoreItem.listitem
   @storeitems = InventoryStoreItem.all
 end

def view_return_order
  @archived_items = ArchivedItem.all
  @archived_item = ArchivedItem.shod(params[:id])
end

def view_particular_order
  @archived_items = ArchivedItem.all
  @archived_item = ArchivedItem.shod(params[:id])
end

def return_order
  @storeitem = InventoryStoreItem.find(params[:id])
  @archived_item = ArchivedItem.new
end

def archived_item
  @archived_item = ArchivedItem.shod(params[:id])
  @storeitem = InventoryStoreItem.shod(params[:format])
end
 
def archived_item_create
  @storeitem = InventoryStoreItem.shod(params[:format])
  @archived_item = @storeitem.archived_item
  @archived_item.update(item_params)
  redirect_to archived_item_inventory_store_item_path(@archived_item)
end

def return_report
  @archived_items = ArchivedItem.all
  @general_setting = GeneralSetting.first
  render 'return_report', layout: false
end

def select
  @batch = Batch.shod(params[:batch][:id])
  @storeitems ||= @batch.inventory_store_items
end

 def viewAll
   @storeitems = InventoryStoreItem.all
 end

 def new_store_item
  @storeitem = InventoryStoreItem.new
 end

 def show
   @storeitem = InventoryStoreItem.find(params[:id])
 end

 def create_new_store_item
   @storeitem = InventoryStoreItem.new(store_item_params)
   remainig_qty = params[:inventory_store_item][:quantity]
   @storeitem.update(:remainig_qty => remainig_qty)
   @storeitem.save
   redirect_to index_store_item_inventory_store_items_path
 end

 def edit_store_item
   @storeitem = InventoryStoreItem.find(params[:id])
 end

 def update_store_item
   @storeitem = InventoryStoreItem.find(params[:id])
  if @storeitem.update(store_item_params)
    redirect_to index_store_item_inventory_store_items_path
  else
    render 'edit_store_item'
  end
 end

 def destroy_store_item
   @storeitem = InventoryStoreItem.find(params[:id])
   @storeitem.delete
   redirect_to index_store_item_inventory_store_items_path
 end

 private

 def store_item_params
   params.require(:inventory_store_item).permit(:item_name, :quantity,:remainig_qty,:unit_price,:total,:batch_id,:mrp,:category,:date,:supplier_id)
 end

 def item_params
   params.require(:archived_item).permit(:status_description,:option,:return_qty)
 end
end