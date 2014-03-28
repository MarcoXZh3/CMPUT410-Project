class People < ActiveRecord::Base

  def to_s
    return name + '(' + user_id + ')'
  end # def to_s

end
