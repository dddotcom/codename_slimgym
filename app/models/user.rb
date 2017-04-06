class User < ApplicationRecord
    belongs_to :gym

    has_many :checkins

    validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

    validates :password, 
    length: { in: 6..36 }, 
    on: :create

    has_secure_password

    def self.authenticate(params)
        User.find_by_email(params[:email]).try(:authenticate, params[:password])
    end
end
