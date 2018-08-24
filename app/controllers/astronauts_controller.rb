class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average_age
    render "index"
  end
end
