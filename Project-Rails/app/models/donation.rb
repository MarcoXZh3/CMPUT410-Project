class Donation < ActiveRecord::Base
  belongs_to :people
  belongs_to :animal

  def to_s
    if accepted == true
      return people.to_s + ' donated (' + donation_type + ') ' + content
    else
      return people.to_s + ' donates (' + donation_type + ') ' + content
    end
  end

end
