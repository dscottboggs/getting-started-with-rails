require 'jwt'

class Auth

  ENCRYPTION_ALGORITHM = 'HS256'
  def self.issue(payload)
    JWT.encode payload, random_token, ENCRYPTION_ALGORITHM
  end
  
  def self.decode(token)
    JWT.decode(
      token, random_token, true, {algorithm: ENCRYPTION_ALGORITHM}
    ).first
  end
  
  class << self
    def token_path
      Rails.root.join 'secure.token'
    end

    def read_token_from_file
      t = File.open token_path, mode: "rb", &:read
      puts "read token #{t} from file"
      t
    end

    def new_random_token(length=Rails.env.production? ? 64 : 16)
      token = SecureRandom.bytes length
      puts "generated new random token #{token}"
      File.open token_path, mode: 'wb' do |file|
        file.write token
      end
      token
    end

    def random_token
      @random_token ||= read_token_from_file 
      puts "using random token #{@random_token}"
      @random_token
    rescue 
      @random_token = new_random_token
      puts "using random token #{@random_token}"
      @random_token
    end

  end

end