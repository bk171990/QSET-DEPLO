# Events Controller
class EventsController < ApplicationController
 
  # create event object
  # get date on whcih we want to create event
  def new
    @event = Event.new
    if User.current.role == 'SuperAdmin'
      @events = Event.all
      @batches ||= Batch.all
      @departments ||= EmployeeDepartment.all
      @start_date = params[:format]
      authorize! :create, @event
    else
      @events = User.current.school.events
      @batches ||= User.current.school.batches
      @departments ||= User.current.school.employee_departments
      @start_date = params[:format]
      authorize! :create, @event
    end
  end
  
  # create Event object and pass required parameters
  # from private method params_event and
  # create action is saving our new Event to the database.
  def create
    @event = Event.new(params_event)
    @school = User.current.school
    @event.update!(:school_id => @school.id)
    if @event.save
      @event.create_event(params[:batches],params[:departments])
      flash[:notice] = 'Event created successfully'
      redirect_to calender_index_path(@event)
    else
      render 'new'
    end
  end
  
  # this is used for create event for batches
  # get all batches from database
  def show
    @event = Event.shod(params[:id])
    if User.current.role == 'SuperAdmin'
     @batches ||= Batch.all
     @departments ||= EmployeeDepartment.all
     authorize! :read, @event
    else
     @batches ||= User.current.school.batches
     @departments ||=  User.current.school.employee_departments
     authorize! :read, @event
   end
  end
  
  # this is used for create event for departments
  # get all departments from database
  def showdep
    if User.current.role == 'SuperAdmin'
      @departments ||= EmployeeDepartment.all
       authorize! :create, Event
    else
      @departments ||= User.current.school.employee_departments
      authorize! :create, Event
    end
  end
  
  # this method is used to create event for multipal batch and department
  def update
    @event = Event.shod(params[:event_id])
    if @event.create_event(params[:batches], params[:departments])
      flash[:notice] = 'Event confirmation successfully'
      redirect_to calender_index_path
    end
  end

  def delete
  @event = Event.find_by(params[:id])
  event.destroy
  redirect_to calender_index_paths
end


  # this private methods tell us exactly which parameters are allowed
  # into our controller actions.

  private
  
  def params_event
    params.require(:event).permit!
  end
end