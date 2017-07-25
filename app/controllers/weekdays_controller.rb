# Weekdays Controller
class WeekdaysController < ApplicationController
  
  # This method for display weekdays,
  # first create instance of weekdays,then calculate day and days
  # for selectd week
  def index
    @weekday = Weekday.new
    @day ||= Weekday.day
    @days ||= Weekday.days
    if User.current.role == 'SuperAdmin'
      @weekdays ||= Batch.includes(:course).all
    else
      @weekdays ||= User.current.school.batches
    end
    authorize! :create, @weekday
  end

  # This method for set weekdays for selectd batch,
  # call class method set_days for setting weekday for selectd
  # batch
  def create
    @day ||= Weekday.day
    @days ||= Weekday.days
    @batch = Weekday.set_day(params[:weekday][:batch_id], params[:weekdays])
    flash[:notice] = t('weekday_create')
  end

  # This method for select and hold day of week and days of week
  # for selectd batch
  def select
    @day ||= Weekday.day
    @days ||= Weekday.days
    @batch = Batch.shod(params[:batch][:id])
    authorize! :read, Weekday
  end
end
