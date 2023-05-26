require "rails_helper"

RSpec.describe "the Department index page" do
  # User Story 1: Department Index
  it "I see each departments name and floor and underneath each department, I can see the names of all of its employees" do 
    department1 = Department.create!(name: "IT", floor: 2)
    department2 = Department.create!(name: "Sales", floor: 3)
    employee1 = department1.employees.create!(name: "Jolene", level: 7)
    employee2 = department1.employees.create!(name: "Simon", level: 5)
    employee3 = department2.employees.create!(name: "Brett", level: 6)
    employee4 = department2.employees.create!(name: "Jana", level: 2)

    visit "/departments"

    within "#dept-#{department1.id}" do
      expect(page).to have_content(department1.name)
      expect(page).to have_content(department1.floor)
      expect(page).to have_content(employee1.name)
      expect(page).to have_content(employee2.name)
      expect(page).to_not have_content(department2.name)
      expect(page).to_not have_content(department2.floor)
      expect(page).to_not have_content(employee3.name)
      expect(page).to_not have_content(employee4.name)
    end

    within "#dept-#{department2.id}" do
      expect(page).to have_content(department2.name)
      expect(page).to have_content(department2.floor)
      expect(page).to have_content(employee3.name)
      expect(page).to have_content(employee4.name)
      expect(page).to_not have_content(department1.name)
      expect(page).to_not have_content(department1.floor)
      expect(page).to_not have_content(employee1.name)
      expect(page).to_not have_content(employee2.name)
    end
  end
end
