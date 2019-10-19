# frozen_string_literal: true

class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.order(:id)
  end

  def show
    @teacher = Teacher.find(params[:id].to_i)
  end

  def new
    @teacher = Teacher.new
  end

  def create; end

  def edit
    @teacher = Teacher.find(params[:id].to_i)
  end

  def update; end

  def destroy; end

  def select
    @teachers = Teacher.all.order(:id)
  end
end
