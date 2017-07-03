class SuppliersController < ApplicationController

 def new_supplier
  @supplier = Supplier.new
 end

 def index_supplier
  @suppliers= Supplier.all
 end

 def create_new_supplier
  @supplier = Supplier.new(supplier_params)
  if @supplier.save
  	redirect_to index_supplier_suppliers_path
  else
  	render 'new_supplier'
  end
 end

 def edit_supplier
  @supplier = Supplier.find(params[:id])
 end

 def update_supplier
  @supplier = Supplier.find(params[:id])
  if @supplier.update(supplier_params)
  	redirect_to index_supplier_suppliers_path
  else
  	render 'edit_supplier'
  end
 end

 def destroy_supplier
 @supplier = Supplier.find(params[:id])
 @supplier.delete
 redirect_to index_supplier_suppliers_path
 end

 private
  def supplier_params
   params.require(:supplier).permit!
  end
end

