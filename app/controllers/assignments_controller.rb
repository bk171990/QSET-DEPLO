class AssignmentsController < ApplicationController

	def new
		@assignment = Assignment.new
		@due_date = params[:format]
		@student = Student.all
		@batches ||= Batch.includes(:course).all
		@assignment_attachment = @assignment.assignment_attachments.build
	end

	def create
		@assignment = Assignment.new(params_assignment)
	  @assignment.save
		redirect_to assignments_path
		 if  params[:assignment_attachments].present?
	   params[:assignment_attachments]['file'].each do |a|
         @assignment_attachment = @assignment.assignment_attachments.create!(:file => a)
       end
     end
  	end

	def edit
		@assignment = Assignment.find(params[:id])		
	end

	def update
		@assignment = Assignment.find(params[:id])
		 @assignment.update(params_assignment)
		redirect_to assignments_path 
	end

	def show
		@assignment = Assignment.find(params[:id])
		@assignment_attachments = @assignment.assignment_attachments.all
	end

	def student_show
		@assignment = Assignment.find(params[:id])
		@assignment_attachments = @assignment.assignment_attachments.all
	end

	def destroy
		@assignment = Assignment.find(params[:id])
		@assignment.destroy
		redirect_to assignments_path
	end

	def index
		@assignments = Assignment.all
	end



	private

	def params_assignment
		params.require(:assignment).permit(:title,:assignment_subject, :content,:due_date,:subject_id,:batch_id,:student_id,assignment_attachments_attributes: [:file])
	end

end