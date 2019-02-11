class JSONWebToken
  def self.encode(payload)
    JWT.encode payload, Rails.application.secrets.secret_key_base
  end

  def self.decode!(payload)
    HashWithIndifferentAccess.new(
      JWT.decode(
        token, Rails.application.secrets.secret_key_base
      )[0]
    )
  end

  def self.decode(payload)
    decode! payload
  rescue e
    nil
  end
end
