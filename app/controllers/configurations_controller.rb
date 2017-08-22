class ConfigurationsController < ApplicationController
	def new
		@configure = Configurable.new
			@configures = Configurable.all
	end

	def create
		@configure = Configurable.new(params_configure)
	 @configure.save
		redirect_to new_configuration_path
	end

	def destroy
		@configure = Configurable.find(params[:id])
		@configure.destroy
		redirect_to new_configuration_path
	end

	private
	def params_configure
		params.require(:configurable).permit!
	end
end
