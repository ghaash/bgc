class User < ActiveRecord::Base # active record pass ruby into SQL (laymens terms)

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :games #has_many and belongs_to ties assocations between classes
  has_secure_password #works with brcyt
  validates :username, presence: true #users not valid without user/email
  validates :email, presence: true

end
