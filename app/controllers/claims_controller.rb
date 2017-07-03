class ClaimsController < ApplicationController
  
  def index
    @courses ||= Course.all
  end

  def other_claim
    @courses ||=Course.all
  end

  def view_remainingqty
    @claims = Claim.all
  end

  def view_all_claim
    @claims = Claim.all
    @claims ||= @batch.claims.all
  end

  def approved_index
    @courses ||= Course.all
  end

  def select_batch
    @course = Course.shod(params[:course][:id])
    @batches ||= @course.batches.all
  end

  def select_claim_other
    @course = Course.shod(params[:course][:id])
    @batches ||= @course.batches.all
  end

  def select_approved_batch
    @course = Course.shod(params[:course][:id])
    @batches ||= @course.batches.all
  end
  
  def new
    @batch = Batch.shod(params[:format])
    @claim = @batch.claims.build
    @course = @batch.course
  end

  def show_claim
    @batch = Batch.shod(params[:id])
    @claims ||= @batch.claims.all
    @course = @batch.course
  end

  def show_other_claim
    @batch  = Batch.shod(params[:id])
    @claims ||=@batch.claims
    @course = @batch.course
  end

  def report_other_claim
    @claims = Claim.all
    @general_setting = GeneralSetting.first
    render 'report_other_claim', layout: false
  end

  def approved_claim
    @claim = Claim.shod(params[:id])
    @batch = Batch.shod(params[:id])
    @claims ||= @batch.claims.all
    @course = @batch.course
  end

  def view_all
    @claims = Claim.all
    @batches ||= Batch.all
  end

  def claim_main_page
    @claim = Claim.new
  end

  def publish_claim
    @date = Date.today
    @claim = Claim.shod(params[:format])
    @claim.update(is_published: true)
  end

  def publish_result
    @claim = Claim.shod(params[:format])
    if @claim.is_published?
      flag = @claim.publish_claim(@claim)
      publish_res(flag)
    else
      flash[:alert] = 'Claim not approved'
    end
    redirect_to claims_path(@claim)
  end

  def publish_res(flag)
    if flag == false
      flash[:alert] = 'Claim results cannot be approved'
    else

      if @claim.update(result_published: true)
        @claim.inventory_store_item.update_attributes(remainig_qty: @claim.inventory_store_item.remainig_qty.to_i - @claim.claim_quantity.to_i)
        flash[:notice] = 'Approved successfully'
      end
    end
  end


  def create
    @batch = Batch.shod(params[:format])
    @claim = @batch.claims.new(claim_params)
   if @claim.save
    flash[:notice] = 'Claim created'
    redirect_to show_claim_claim_path(@batch)
   else
    render 'new' 
   end
  end

  def edit
    @claim = Claim.find(params[:id])
  end

  def update
    @claim = Claim.find(params[:id])
    if @claim.update(claim_params)
      redirect_to claims_path
    else
      render 'edit'
    end
  end 

  def destroy
    @claim = Claim.shod(params[:id])
    authorize! :delete, @claim
    batch = @claim.batch
    @claim.destroy
    flash[:notice] = 'Claim List deleted successfully!'
    redirect_to claim_path(batch)
    authorize! :destroy, @claim
  end

  def advanced_search
    @courses ||= Course.all
    @batches ||= Course.first.batches unless Course.first.nil?
  end

  def advanced_claim_search
    @claims = Claim.all
    @claims ||= Claim.advance_search(params[:search], params[:batch]) unless params[:batch].nil?
  end

  def claim_advance_search
    @course = Course.all
  end

  def search
    @claims = Claim.search_claim(params[:search])
  end

  private

  def claim_params
    params.require(:claim).permit(:inventory_store_item_id,:claim_item,:claim_quantity,:purchase_date,:comment,:batch_id,:course_id)
  end
end