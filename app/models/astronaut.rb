class Astronaut < ApplicationRecord

  validates_presence_of :name, :age, :job

  has_many :astronaut_space_missions
  has_many :space_missions, through: :astronaut_space_missions

  def self.average_age
    Astronaut.average(:age)
  end

  def self.missions(id)

  end
end
