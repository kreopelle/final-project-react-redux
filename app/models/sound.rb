class Sound < ApplicationRecord
  has_one_attached :sound

  validates :title, :description, presence: true

end
