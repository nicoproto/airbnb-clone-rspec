class Dog < ApplicationRecord
  belongs_to :user
  has_many :dogs, dependent: :destroy

  validates_presence_of :name, :location, :price, :description
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 25 }
  validates_uniqueness_of :name, case_sensitive: false

  def short_description
    description[0..85].gsub(/\s\w+\s*$/,'...')
  end
end
