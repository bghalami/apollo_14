require "rails_helper"

describe AstronautSpaceMission, type: :model do
  describe "methods" do
    describe "list of misison" do
      it "should return a list of missions for an astronaut" do
        astro1 = Astronaut.create(name: "Ben", age: 1000, job: "cook")
        astro2 = Astronaut.create(name: "Ken", age: 2000, job: "kook")
        mission1 = SpaceMission.create(title: "A Mission", trip_length: 200)
        mission2 = SpaceMission.create(title: "B Mission", trip_length: 300)
        AstronautSpaceMission.create(astronaut_id: astro1.id,
                                     space_mission_id: mission1.id)
        AstronautSpaceMission.create(astronaut_id: astro1.id,
                                     space_mission_id: mission2.id)
        expect(Astronaut.missions(astro1.id)).to eq(["#{mission1.title}","#{mission2.title}"])
      end
    end
  end
end
