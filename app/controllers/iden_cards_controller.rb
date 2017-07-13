class IdenCardsController < ApplicationController

	before_action :load_batch ,only: [:selected_batch]

  def new
    @identity_card = IdenCard.new
    @batches = Batch.all
  end

  def create
    ids = []
    batch_id = Batch.find_by(id: params[:iden_card][:batch_id])
    batch_id.present? && params[:student_ids].present? && params[:student_ids].each do |student_id|
      if Student.find(student_id.to_i)
        ids << student_id
        identity_card = IdenCard.find_or_initialize_by(student_id: student_id.to_i, batch_id: params[:iden_card][:batch_id])
        identity_card.description = params[:iden_card][:description]
        identity_card.save
      end
    end
    @students = Student.where(id: ids)
    @guardian = Guardian.all
    @general_setting = GeneralSetting.first
  end

  def selected_batch
  	@students = @batch.students
  end

  def show
  	
  end

  private

   def load_batch
   	 @batch = Batch.find(params[:id])
   end

   def card_params
      params.require(:iden_card).permit(:description, :student_ids,:batch_id)
   end
end