class Users < ActiveRecord::Base
  attr_accessible :password, :username
end
