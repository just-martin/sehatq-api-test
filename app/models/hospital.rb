class Hospital < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :doctors, through: :schedules

  validates :name, presence: true

  def to_api
    return { name: self.name }
  end
end
