class Receipt < ActiveRecord::Base
  belongs_to :people
  belongs_to :animal

  def to_s
      return people.to_s + ' received ' + animal.to_s
  end

end
