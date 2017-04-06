class User < ApplicationRecord
    
    has_many :pets

    validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

    validates :password, 
    length: { in: 8..36 }, 
    on: :create

    has_secure_password

    def self.authenticate(params)
        User.find_by_email(params[:email]).try(:authenticate, params[:password])
    end
end
