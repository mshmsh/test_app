class Customer < ActiveRecord::Base
	has_many :orders, :dependent => :destroy
	#accepts_nested_attributes_for :orders ,:allow_destroy => true
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
    validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
    validates :email, :presence => true,
                    :length => { :maximum => 100 },
                    :format => EMAIL_REGEX
    validates :pay_type , :presence => true
     
end
