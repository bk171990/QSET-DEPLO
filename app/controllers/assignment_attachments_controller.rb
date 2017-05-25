class AssignmentAttachmentsController < ApplicationController

  def destroy
  	@assignment_attachment = AssignmentAttachment.find(params[:id])
  	@assignment_attachment.destroy
  	redirect_to assignments_path(@assignment_attachment)
  end

end