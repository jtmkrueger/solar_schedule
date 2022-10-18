class EmployeePto < ApplicationRecord
  belongs_to :employee

  enum pto_type: {
    sick: 0,
    vacation: 1,
    personal: 2,
  }

  validates :pto_type, presence: true
end
