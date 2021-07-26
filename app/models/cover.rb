class Cover < ApplicationRecord
  belongs_to :user, optional: true
end
