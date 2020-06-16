class Doctor < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :hospitals, through: :schedules

  validates :name, presence: true

  def to_api
    return { name: self.name }
  end
end
