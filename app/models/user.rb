class User < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :games
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true

end
