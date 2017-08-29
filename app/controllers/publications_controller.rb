class PublicationsController < ApplicationController
 
 def new
   @publication = Publication.new
   @publications = Publication.all
 end

 def create
   @publication = Publication.new(pub_params)
   if @publication.save
    redirect_to new_publication_path
   else
    render 'new'
  end
 end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(pub_params)
      redirect_to new_publication_path
    else
      render 'new'
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    if @publication.destroy
      redirect_to new_publication_path
    else
      render 'new'
    end
  end

  private

  def pub_params
    params.require(:publication).permit(:name)
  end
end

