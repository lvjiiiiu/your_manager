class Contact < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true, length: {maximum: 200, minimum: 2}
end
