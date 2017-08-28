class MessageToAllBatchesController < ApplicationController
	def new
		@message_to_all_batch = MessageToAllBatch.new
		@batches ||= Batch.includes(:course).all
	end

	 def create
    ids = []
    params[:batch_ids].present? && params[:batch_ids].each do |batch_id|
      if Batch.find(batch_id.to_i)
        ids << batch_id
        message = MessageToAllBatch.find_or_initialize_by(batch_id: batch_id.to_i)
        message.body = params[:message_to_all_batch][:body]
        message.save
      end
    end
    flash[:notice] = t('message_to_batch_sent')
    @message_to_all_batches = Batch.where(id: ids)
    redirect_to '/bulk_messages/sms'
  end


  def index
    @message_to_all_batches = MessageToAllBatch.all
  end

	private

	def params_bulk_message
		params.require(:message_to_all_batch).permit!
	end
end
