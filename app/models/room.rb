class Room < ApplicationRecord
  has_many :messages

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(2)
  end

  def to_param
    token
  end
end
