class User < ActiveRecord::Base
  attr_accessor :password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name,      # makes sure that user has entered name
                        :presence     => true, 
                        # users name cannot be longer than 50 chars
                        :length       => { :maximum => 50 } 

  validates :email,     # makes sure that user has entered email
                        :presence     => true, 
                        # makes sure email are valid for web format
                        :format       => { :with => email_regex }, 
                        # lets upcase and downcase email be the same
                        :uniqueness   => { :case_sensitive => false } 

  validates :password,  # make sure user has entered password
                        :presence     => true,
                        # make sure passwords match
                        :confirmation => true, 
                        # min 6 chars and max 40 chars
                        :length       => { :within => 6..40 } 
end