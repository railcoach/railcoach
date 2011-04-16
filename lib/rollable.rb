class ActiveRecord::Base
  def self.is_rollable
    has_many :roles, :as => :thing
  end
end
