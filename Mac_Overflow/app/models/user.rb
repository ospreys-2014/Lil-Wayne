class User < ActiveRecord::Base
   has_secure_password
   has_many :entries

   validates :name, presence: true, length: { maximum: 50 }
   validates :password, length: { minimum: 3 }

end