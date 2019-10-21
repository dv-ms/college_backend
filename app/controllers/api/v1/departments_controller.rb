module Api
    module V1
      class DepartmentsController < ApplicationController
        before_action :authenticate_api_access_token, only: [:index, :show, :search]
        before_action :authenticate_api_modify_token, only: [:create, :update, :destroy]
  
        def index
          departments = Department.all.order(:id)
          API_respond(200, "Listof all departments", departments)
        end
  
        def show
          department = Department.find_by(id: params[:id].to_i)

          status = 0
          message = ""
          data = nil

          if department!=nil
            status = 200
            message = "Department found"
            data = department
          elsif department==nil
            status = 404
            message = "Department not found with given ID"
            data = nil
          end
          API_respond(status, message, data) 
        end
  
        def create
          department = Department.new(department_params)
          status = 0
          message = ""
          data = nil

          if department.save
            status = 201
            message = "Department created"
            data = department

          elsif !department.save
            status = 500
            message = department.errors.full_messages[0]
            data = nil
          end
          API_respond(status, message, data)
        end
  
        def update
          status = 0
          message = ""
          data = nil
          
          new_name = params[:name]
          new_hod_id = params[:hod_id]

          if Department.update(params[:id], :name => new_name, :hod_id => new_hod_id.to_i)
            department = Department.find(params[:id])
            status =200
            message = "Department updated"
            data = department
          else
            status = 500
            message = "Unable to update department"
            data = nil
          end

          API_respond(status, message, data)


        end
  
        def destroy
          status = 0
          message = ""
          data = nil

          if Department.destroy(params[:id])
            status = 200
            message = "Department deleted successfully"
            data = nil
          else
            status = 500
            message = "Internal Server error. cannot delete"
            data = nil
          end
          API_respond(status, message, data)
        end

        def search
          departments = Department.new
          
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

          puts name
          puts hod_id
          puts page

          result = SearchDepartments.new(name, hod_id, page).execute

          if result.success?
            departments = result.result
          end

          if params[:sort_by_name].present?
            if params[:sort_by_name] == "true"
              departments = departments.order(:name)
              
            elsif params[:sort_by_name] == "false"
              departments = departments.order("name DESC")
            end

          end

          if params[:sort_by_id].present?
            if params[:sort_by_id] == "true"
              departments = departments.order(:id)
            elsif params[:sort_by_id] == "false"
              departments = departments.order("id DESC")  
            end

          end

          status = 200
          message = "Departments search results"
          data = departments

          API_respond(status, message, data)
        end
        
        private
        def department_params
          params.require(:department).permit(:name, :hod_id)
        end
      end
    end
  end  