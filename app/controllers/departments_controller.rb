# frozen_string_literal: true

class DepartmentsController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]


  @sorted_by_name = false
  @sorted_by_id = true

  def index

    @departments = Department.new
    name = ""
    hod_id = ""
    page = ""

    if params[:search_name].present?
      name = params[:search_name]
    end

    if params[:search_hod_id].present?
      hod_id = params[:search_hod_id]
    end

    if params[:page].present?
      page = params[:page]
    end

    result = SearchDepartments.new(name, hod_id, page).execute

    if result.success?
      puts "sucesssss **********************"
      puts result.result
      @departments = result.result
    end

    if params[:sort_by_name].present?

      if params[:sort_by_name] == "true"
        @sorted_by_name = true
        @sorted_by_id = false
        @departments = @departments.order(:name)
        
      elsif params[:sort_by_name] == "false"
        @sorted_by_name = false
        @sorted_by_id = false
        @departments = @departments.order("name DESC")
      end

    end

    if params[:sort_by_id].present?

      if params[:sort_by_id] == "true"
        @sorted_by_id = true
        @sorted_by_name = false
        @departments = @departments.order(:id)
        
      elsif params[:sort_by_id] == "false"
        @sorted_by_id = false
        @sorted_by_name = false
        @departments = @departments.order("id DESC")  
      end

    end

    respond_to do |format|
      format.json {render json: @departments, each_serializer: DepartmentsSerializer, root:false}
      format.html
    end
  end

  def show
    id = params[:id].to_i
    @department = Department.find(id)

    respond_to do |format|
      format.html
      format.json { render json: @department }
    end
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(get_params)

    if @department.save
      #flash "New Department created"
      redirect_to department_path(@department)
    else render :new
    end

  end

  def edit
    id = params[:id].to_i
    @department = Department.find(id)
  end

  def update
    id = params[:id].to_i
    @department = Department.find(id)

    if @department.update(get_params)
      redirect_to department_path(@department)
    else render :edit
    end
  end

  def destroy
    id = params[:id].to_i
    @department = Department.find(id)

    if @department.destroy
      #flash "Destroyed"
      redirect_to department_path
    else render :index
    end
  end

  def search
    respond_to :json
    name_query = params[:name]
    hod_id_query = params[:hod_id]

    if (name_query=='' || !params[:name].present?) && (hod_id_query = '' || !params[:hod_id].present?)
      @department_search_results = Department.all.order(:id)
    elsif params[:name].present? && params[:name]!='' && (hod_id_query = '' || !params[:hod_id].present?)
      @department_search_results = Department.all.where("name ILIKE '#{name_query}%'").order(:id)
    elsif params[:hod_id].present? && hod_id_query!='' && (name_query=='' || !params[:name].present?)
      @department_search_results = Department.all.where("hod_id = '#{hod_id_query}%'").order(:id)
    elsif params[:name].present? && params[:hod_id].present? && params[:name]!='' && params[:hod_id]!=''
      @department_search_results = Department.all.where("name ILIKE '#{name_query}%' AND hod_id = #{hod_id_query}").order(:id)
    end

    respond_to do |format|
      format.json { render json: @department_search_results }
     end

  
  end

  def assignment
  end

  def get_name
    @name = Department.first.name
    @id = Department.first.id
  end

  def get_department
    id = params[:id].to_i
    @department = Department.find(id)
  end

  private
  def get_params
    params.require(:department).permit(:id, :name, :hod_id)
  end
end