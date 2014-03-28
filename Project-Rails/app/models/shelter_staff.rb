class ShelterStaff < ActiveRecord::Base
  belongs_to :user
  belongs_to :people
  belongs_to :shelter

  def to_s
    return people.to_s
  end

end
