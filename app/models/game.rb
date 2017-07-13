class Game < ActiveRecord::Base #class Game, belongs to user

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :user

end
