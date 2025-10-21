class Survey < ApplicationRecord
  belongs_to :user, optional: true
end