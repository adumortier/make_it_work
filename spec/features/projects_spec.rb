require 'rails_helper'

RSpec.describe "As a visitor" do 

  before :each do
    @challenge = Challenge.create!(theme: "coding", project_budget: "1000") 

    @project1 = @challenge.projects.create!(name: "Litfit", material: "Lamp Shade")  
    
    @project1.contestants.create!(name: "Alex", age:"40", hometown: "chauny", years_of_experience: "10")
    @project1.contestants.create!(name: "Jordan", age:"38", hometown: "Boston", years_of_experience: "7") 

    visit "/projects/#{@project1.id}"
  end

  it "the project show page displays the project name and material" do
    expect(page).to have_content("Name: #{@project1.name}")
    expect(page).to have_content("Material: #{@project1.material}")
    expect(page).to have_content("Theme: #{@project1.challenge.theme}")
  end

  it "the project show page displays the number of participants" do 
    expect(page).to have_content("Name: #{@project1.name}")
    expect(page).to have_content(@project1.count_contestants)
  end

  it "the project show page displays the number of participants" do 
    expect(page).to have_content(@project1.name)
    expect(page).to have_content("Average age: #{@project1.average_age}")
  end
end
  