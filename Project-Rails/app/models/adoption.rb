class Adoption < ActiveRecord::Base
  belongs_to :people
  belongs_to :animal

  def to_s
    if accepted == true
      return people.to_s + ' adopted ' + animal.to_s
    else
      return people.to_s + ' adopts ' + animal.to_s
    end
  end # def to_s

end
