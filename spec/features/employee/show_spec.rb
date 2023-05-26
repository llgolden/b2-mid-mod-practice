require "rails_helper"

RSpec.describe "the Employee show page" do
  # User Story 2: Employee Show
  it "I see the employee's name, their department, and a list of all of their tickets from oldest to newest and the oldest ticket assigned to the employee listed separately" do 
    department1 = Department.create!(name: "IT", floor: 2)
    employee1 = department1.employees.create!(name: "Jolene", level: 7)
    employee2 = department1.employees.create!(name: "Simon", level: 5)
    ticket1 = Ticket.create!(subject: "printers broken", age: 3, employee_id: "#{employee1.id}")
    ticket2 = Ticket.create!(subject: "computer unplugged", age: 2, employee_id: "#{employee2.id}")
    ticket3 = Ticket.create!(subject: "forgot password", age: 1, employee_id: "#{employee1.id}")
    ticket4 = Ticket.create!(subject: "error messages", age: 5, employee_id: "#{employee1.id}")
    EmployeeTicket.create!(employee: employee1, ticket: ticket1)
    EmployeeTicket.create!(employee: employee1, ticket: ticket3)
    EmployeeTicket.create!(employee: employee1, ticket: ticket4)
    EmployeeTicket.create!(employee: employee2, ticket: ticket2)


    visit "/employees/#{employee1.id}"
save_and_open_page
    expect(page).to have_content(employee1.name)
    expect(page).to have_content(department1.name)
    expect(ticket4.subject).to appear_before(ticket1.subject)
    expect(ticket1.subject).to appear_before(ticket3.subject)

    expect(page).to_not have_content(employee2.name)
    expect(page).to_not have_content(ticket2.subject)


# I also see the oldest ticket assigned to the employee listed separately.

  end
end
