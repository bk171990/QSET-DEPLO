class ReportsController < ApplicationController
	 before_action :load_report, only: [:import, :import_form], unless: -> { params[:id].nil? }

   def report_index
	  	@reports = User.current.school.reports
	 end

	 def new_report
	  	@report = Report.new
	 end

   def create_report
     @report = Report.new(report_params)
     @school = User.current.school
     @report.update!(:school_id => @school.id)
     @report.save
     redirect_to report_index_reports_path(@report)
   end

   def import_form
   end

   def import
      if params[:file].present? 
     importer = @report.model == 'Guardian Admission' ? Guardian : Student
     importer.import(params[:file])
     redirect_to report_index_reports_path(@report), notice: "#{importer}s imported."
      else
       redirect_to import_form_report_path(@report), notice: "Select a Report"
     end
   end

   def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to report_index_reports_path(@report), notice: "Report Deleted"
  end
 
   def show
   end

   private

   def load_report
     @report = Report.find_by_id(params[:id])
   end

   def report_params
    params.require(:report).permit(:name, :model,:relation)
   end
end
