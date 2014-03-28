class Shelter < ActiveRecord::Base

  def to_s
    return name + '(' + shelter_type + ')'
  end

end
