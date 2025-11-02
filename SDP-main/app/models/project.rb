class Project < ApplicationRecord
  # --- İlişkiler ---
  belongs_to :user

  # --- Sabit Durumlar ---
  STATUSES = %w[planning active completed on_hold].freeze

  # --- Doğrulamalar ---
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
