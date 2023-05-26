class EmployeesController < ApplicationController
  def show  
    @employee = Employee.find(params[:id])
    @emp_ticks = Employee.sort_tickets(@employee)
  end

  def create
    @employee = Employee.find(params[:id])
    require 'pry'; binding.pry
    emp_ticket = EmployeeTicket.create!(ticket_params)
    redirect_to "/employees/#{@employee.id}"
  end

  private
  def ticket_params
    params.permit(:subject, :age, :employee_id)
  end
end
