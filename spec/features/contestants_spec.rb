require 'rails_helper'

RSpec.describe "As a visitor" do 

  before :each do
    @challenge = Challenge.create!(theme: "coding", project_budget: "1000") 
    
    @contestant1 = Contestant.create!(name: "Alex", age:"40", hometown: "chauny", years_of_experience: "10")
    @project1 = @contestant1.projects.create(name: "Litfit", material: "Lamp Shade", challenge_id: @challenge.id)
    @project2 = @contestant1.projects.create(name: "DIY", material: "Metal", challenge_id: @challenge.id)
    @project3 = @contestant1.projects.create(name: "Club", material: "wood", challenge_id: @challenge.id)

    @contestant2 = Contestant.create!(name: "Jordan", age:"37", hometown: "Boston", years_of_experience: "7")
    @project4 = @contestant2.projects.create(name: "Litfit", material: "Lamp Shade", challenge_id: @challenge.id)
    @project5 = @contestant2.projects.create(name: "DIY", material: "Metal", challenge_id: @challenge.id)
  end

  it "the contestant index page shows a list of contestants" do
    visit "/contestants"
    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.projects[0].name)
    expect(page).to have_content(@contestant1.projects[1].name)
    expect(page).to have_content(@contestant1.projects[2].name)

    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.projects[0].name)
    expect(page).to have_content(@contestant2.projects[1].name)
  end
end