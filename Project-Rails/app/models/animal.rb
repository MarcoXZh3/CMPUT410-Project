class Animal < ActiveRecord::Base
  belongs_to :shelter

  def to_s
    return name + '(' + species + ')'
  end

end
