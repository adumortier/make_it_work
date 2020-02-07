require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#count_contestants" do
    it "can count the number of contestants for a project" do
      @challenge = Challenge.create!(theme: "coding", project_budget: "1000") 
      @project1 = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: @challenge.id)
      @project1.contestants.create!(name: "Alex", age:"40", hometown: "chauny", years_of_experience: "10")
      @project1.contestants.create!(name: "Jordan", age:"37", hometown: "Boston", years_of_experience: "7")
      expect(@project1.count_contestants).to eq 2
    end
  end

  describe "#average_age" do
    it "can calculate the average age of the contestants for a project" do
      @challenge = Challenge.create!(theme: "coding", project_budget: "1000") 
      @project1 = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: @challenge.id)
      @project1.contestants.create!(name: "Alex", age:"40", hometown: "chauny", years_of_experience: "10")
      @project1.contestants.create!(name: "Jordan", age:"38", hometown: "Boston", years_of_experience: "7")
      expect(@project1.average_age).to eq 39
    end
  end


end
