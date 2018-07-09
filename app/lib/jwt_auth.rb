class JwtAuth
  def self.encode_token(payload)
    JWT.encode payload, ENV['JWT_AUTH_SECRET'], 'HS256'
  end

  def self.decode_token(token)
    # JWT.decode token, ENV['JWT_AUTH_SECRET'], true, { algorithm: ENV['JWT_AUTH_ALGORITHM'] }
    return nil if token.nil?

    begin
      JWT.decode token, ENV['JWT_AUTH_SECRET'], true, { algorithm: ENV['JWT_AUTH_ALGORITHM'] }
    rescue => exception
      return nil
    end
  end
end