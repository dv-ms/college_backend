# frozen_string_literal: true

class SectionsController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    id = params[:id].to_i
    @section = Section.find(id)
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(get_params)
    redirect_to section_path(@section) if @section.save
    render :new if @sections.errors.any?
  end

  def edit
  end

  def update; end

  def destroy; end

  private
  def get_params
    params.require(:section).permit(:id, :department_id, :teacher_id)
  end
end
