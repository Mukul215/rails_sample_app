class User < ActiveRecord::Base

  validates :name,  :presence   => true, # makes sure that user has entered name
                    :length     => { :maximum => 50 } # users name cannot be longer than 50 chars

  validates :email, :presence   => true, # makes sure that user has entered email
                    :format     => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, # makes sure email are valid for web format
                    :uniqueness => { :case_sensitive => false } # lets upcase and downcase email be the same
end
