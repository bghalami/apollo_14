require "rails_helper"

describe "user can see list of astros on index page" do
  it "should show all astronauts and attributes" do
    astro1 = Astronaut.create(name: "Ben", age: 1000, job: "cook")
    astro2 = Astronaut.create(name: "Ken", age: 2000, job: "kook")

    visit("/astronauts")

    expect(page).to have_content("Name: #{astro1.name}")
    expect(page).to have_content("Name: #{astro2.name}")
    expect(page).to have_content("Age: #{astro1.age}")
    expect(page).to have_content("Age: #{astro2.age}")
    expect(page).to have_content("Job: #{astro1.job}")
    expect(page).to have_content("Job: #{astro2.job}")
  end
  it "should show average age" do
    astro1 = Astronaut.create(name: "Ben", age: 1000, job: "cook")
    astro2 = Astronaut.create(name: "Ken", age: 2000, job: "kook")

    visit("/astronauts")

    expect(page).to have_content("Average Age: #{Astronaut.average_age}")
  end
  it "should show space missions in alphabetical order for each astro" do
    astro1 = Astronaut.create(name: "Ben", age: 1000, job: "cook")
    astro2 = Astronaut.create(name: "Ken", age: 2000, job: "kook")
    mission1 = SpaceMission.create(title: "A Mission", trip_length: 200)
    mission2 = SpaceMission.create(title: "B Mission", trip_length: 300)

    visit("/astronauts")

    within("##{astro1.id}") do
      expect(page).to have_content("#{mission1.title}#{mission2.title}")
    end
    within("#astro2.id") do
      expect(page).to have_content("#{mission1.title}")
    end
  end
end
