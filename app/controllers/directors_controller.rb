class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id=params.fetch("the_id")
    matching_records=Director.where({ :id => the_id})
    @the_director = matching_records.at(0)
    render({:template => "director_templates/details"})
  end

  def junior
    render({:template => "director_templates/youngest"})
  end

  def senior 
    s=Director.where.not({ :dob => nil }).maximum(:dob)
    render({:template => "director_templates/oldest"})
  end
end
