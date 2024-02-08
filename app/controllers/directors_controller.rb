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
    y_bday=Director.where.not({ :dob => nil }).maximum(:dob)
    @j=Director.where({ :dob => y_bday }).at(0)
    @bday_string = y_bday.strftime("%B %d, %Y")
    render({:template => "director_templates/youngest"})
  end

  def senior 
    o_bday=Director.where.not({ :dob => nil }).minimum(:dob)
    @s=Director.where({ :dob => o_bday }).at(0)
    @o_bday_string = o_bday.strftime("%B %d, %Y")
    render({:template => "director_templates/eldest"})
  end
end
