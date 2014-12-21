class Customer < ActiveRecord::Base
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
    validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :pay_type , :presence => true
end
