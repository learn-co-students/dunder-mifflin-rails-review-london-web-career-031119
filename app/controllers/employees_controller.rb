class EmployeesController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
    end

    def index
        @employees = Employee.all
    end

    def update
    @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to @employee
        else
            render :edit
        end
    end

    def create
        # byebug
        @employee = Employee.new(employee_params)
        
        if @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:errors] = @employee.errors.full_messages
            flash[:data] = @employee
            redirect_to new_employee_path
        end
    end

    def new
        if flash[:data]
            @employee = Employee.new(flash[:data])
        else 
            @employee = Employee.new
        end
        @dogs = Dog.all
    end


    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office)
    end
end
