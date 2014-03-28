class AnimalFile < ActiveRecord::Base
  belongs_to :animal

  def to_s
    return file_type + '#' + id + ' of ' + animal.to_s
  end

end
