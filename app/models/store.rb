class Store < ActiveRecord::Base
  before_save :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
