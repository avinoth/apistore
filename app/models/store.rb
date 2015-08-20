class Store < ActiveRecord::Base
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
    self.last_accessed = Time.now
  end

  def update_access
    self.last_accessed = Time.now
    self.accessed_times += 1
    self.save!
  end
end
