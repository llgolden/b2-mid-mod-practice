class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def self.sort_tickets
    require 'pry'; binding.pry

    AR: @employee.tickets.order(age: :desc)
    Ruby: @employee.tickets.sort_by(&:age).reverse
    # find_by_sql("SELECT tickets* FROM EmployeeTickets WHERE")
    # find_by_sql("SELECT shelters.* FROM shelters ORDER BY shelters.name DESC") 
  end
end
