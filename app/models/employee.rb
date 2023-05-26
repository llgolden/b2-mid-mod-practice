class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def self.sort_tickets(employee)
    employee.tickets.order(age: :desc)
    # !!! NEED A METHOD TEST FOR THIS !!!
    # AR: @employee.tickets.order(age: :desc)
    # Ruby: @employee.tickets.sort_by(&:age).reverse
    # find_by_sql("SELECT shelters.* FROM shelters ORDER BY shelters.name DESC") 
  end
end
