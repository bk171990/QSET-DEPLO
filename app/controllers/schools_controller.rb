class SchoolsController < ApplicationController
	#initialize a new school
	def new
		@school = School.new
		@school.password = School.set_password
	end

	def create
		@school = School.new(school_params)
		@school.save
		redirect_to schools_path
	end

	def index
		@schools = School.all
	end

	def edit
		@school = School.find(params[:id])
	end

	def show
		@school = School.find(params[:id])
	end

	def update	
		@school = School.find(params[:id])
		if @school.update(school_params)
		   redirect_to schools_path
	  else
		   render 'edit'
	  end
	end

	def destroy
		byebug
		@school = School.find(params[:id])
		@school.destroy
		redirect_to schools_path
	end

	private

	def school_params
		params.require(:school).permit!	
	end
end