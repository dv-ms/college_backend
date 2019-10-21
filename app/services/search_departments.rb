class SearchDepartments

    def initialize(name, hod_id, page)
        @name = name
        @hod_id = hod_id 
        @page = page
        @page = @page.to_i
        if @page == 0
            @page=1
        end
    end

    def execute
        departments = Department.all
        if @name == "" && @hod_id == ""
            departments = departments.paginate(:page => @page, :per_page => 10).order(:id)
            puts "**************************"
            puts departments
            return OpenStruct.new(success?: true, result: departments)
        elsif @name !="" && @hod_id == ""
            departments = Department.where("name LIKE '#{@name}'").paginate(:page => @page, :per_page => 10).order(:id)
            return OpenStruct.new(success?: true, result: departments)
        elsif @name == "" && @hod_id !=""
            departments  =departments.where("hod_id = #{@hod_id}").paginate(:page => @page, :per_page => 10).order(:id)
            return OpenStruct.new(success?: true, result: departments)
        elsif @name!="" && @hod_id != ""
            departments = departments.where("name ILIKE '#{@name}' AND hod_id = #{@hod_id}").paginate(:page => @page, :per_page => 10).order(:id)
            return OpenStruct.new(success?: true, result: departments)
        end
    end

end