class LibrarySettingsController < ApplicationController

  def new
    @setting = LibrarySetting.new
    @settings = LibrarySetting.all
  end

  def create
    @setting = LibrarySetting.new(setting_params)
    if @setting.save
      # interval = LibrarySetting.last
      # BookMovement.update_all(:library_setting_id => interval)
    	redirect_to new_library_setting_path
    else
    	render 'new'
    end
  end

  def edit
    @setting = LibrarySetting.find(params[:id])
  end

  def update
  	@setting = LibrarySetting.find(params[:id])
  	if @setting.update(setting_params)
  		redirect_to new_library_setting_path
  	else
  		render 'new'
  	end
  end

  def destroy
    @setting = LibrarySetting.find(params[:id])
    if @setting.destroy
    	redirect_to new_library_setting_path
    else
    	render 'new'
    end
  end

  private
    def setting_params
      params.require(:library_setting).permit(:interval,:per_day_fine)
    end
end
