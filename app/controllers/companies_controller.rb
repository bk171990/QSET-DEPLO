# Company Controller
class CompaniesController < ApplicationController
  before_action :set_companies, only: [:edit, :update, :destroy]

  # this method is used for hold the list of all companies
  def index
    @company = Company.new 
    User.current.role == 'SuperAdmin' ?  @companies = Company.all : @companies = User.current.school.companies
  end

  # This method used for create companies,
  # create company instance  and pass required params
  # from private method and call save method on company instance
  def create
    User.current.role == 'SuperAdmin' ?  @companies = Company.all : @companies = User.current.school.companies
    @company = Company.new(company_params)
    if User.current.role != 'SuperAdmin'
    @school = User.current.school
    @company.update!(:school_id => @school.id)
    end
    if @company.save
      redirect_to companies_path
    else
      render 'index'
    end
  end

  # this method is used for edit company
  def edit
  end

  # this method used for update company,first find company which to be update
  # call update method on instance of company
  def update
    @companies.update(company_params)
    flash[:notice] = t('placement_news_update')
  end

  # this method used for destroy company,
  # first find company which to be destroy
  # call destroy method on instance of company
  def destroy
    @companies.destroy
    redirect_to companies_path
    flash[:notice] = t('placement_news_destroyed')
  end

  private

  def set_companies
    @companies = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :criteria)
  end
end
