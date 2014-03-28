class Surrender < ActiveRecord::Base
  belongs_to :people
  belongs_to :animal

  def to_s
    if accepted == true
      return people.to_s + ' surrendered ' + animal.to_s
    else
      return people.to_s + ' surrenders ' + animal.to_s
    end
  end

end
