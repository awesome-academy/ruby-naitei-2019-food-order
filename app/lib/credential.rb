class Credential
  def self.google_client_id
    ENV["google_client_id"]
  end

  def self.google_client_secret
    ENV["google_client_secret"]
  end
end
