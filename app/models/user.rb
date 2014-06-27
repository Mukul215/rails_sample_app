class User < ActiveRecord::Base
  attr_accessor :password

  # used to let users know which chars are appropriate for email
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

  before_save :encrypt_password

  # test to see if there is a password
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  # anything in this block gets a class level self object
  # basically saying User.authenticate
  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      return nil   if user.nil?
      return user  if user.has_password?(submitted_password)
    end
  end

  private
    def encrypt_password
      self.salt = make_salt if new_record?
      # dont need to add self in the right part of the line
      # if ommited on left side, local variable
      # 'self' implies user object
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    # secure password based on time so rainbow attacks cannot happen
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    # use Digest::SHA2 to encrypt a password
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end