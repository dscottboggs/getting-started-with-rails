class User < ApplicationRecord
  has_secure_password

  EXPIRY_DELAY = 60 * 60 * 24 * 30

  def session_token
    # TODO: implement
    Auth.issue({ user: name, expiry: Time.now + EXPIRY_DELAY })
  end
  
end
