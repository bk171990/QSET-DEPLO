class FineCollectionsController < ApplicationController

  def new
    @fine_collection = FineCollection.new
  end

  def fine_list
    @start_date = params[:fine_collection][:start_date].to_date
    @end_date = params[:fine_collection][:end_date].to_date
    if @end_date.nil? || @start_date.nil?
      flash[:alert] = t('fine_error')
      render 'new'
    else
      @fines ||= Fine.list(@start_date, @end_date)
    end
  end

  def fine_report
  	@general_setting = GeneralSetting.first
  	@fines = Fine.all
  	render 'fine_report',layout: false
  end
end
