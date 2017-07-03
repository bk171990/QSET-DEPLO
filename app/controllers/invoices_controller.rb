class InvoicesController < ApplicationController

def new_invoice
 @invoice = Invoice.new
 @batches ||= Batch.includes(:course).all
end

def create
 @invoice = Invoice.new(invoice_params)
 @invoice.save
 flash[:notice] = 'invoice created'
 redirect_to new_invoice2_invoices_path(@invoice)
end

def invoice_list
 @start_date = params[:invoice][:start_date].to_date
 @end_date = params[:invoice][:end_date].to_date
   if @end_date.nil? || @start_date.nil?
    flash[:alert] = t('invoice_error')
    render 'new_invoice'
   else
      @storeitems ||= InventoryStoreItem.list(@start_date, @end_date)
    end
end

def invoice_report
  @general_setting = GeneralSetting.first
  @start_date = params[:start_date].to_date
  @end_date = params[:end_date].to_date
  @storeitems ||= InventoryStoreItem.list(@start_date, @end_date)
  @batches ||= Batch.includes(:course).all
  render 'invoice_report', layout: false
end

private

def invoice_params 
  params.require(:invoice).permit(:batch_id,:supplier_id,:from_date,:to_date,:invoice_no,:invoice_date,:due_date,invoice_items_attributes: [:unit_price,:quantity,:total,:category,:inventory_store_item_id])
end

end