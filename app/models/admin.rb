class Admin < ApplicationRecord
  devise :database_authenticatable, authentication_keys:[:email,:password]
end
