class Employee < ApplicationRecord
  has_many :employee_ptos

  enum employee_type: {
    laborer: 0,
    certified_installer: 1,
    installer_pending_certification: 2,
  }

  validates :employee_type, presence: true

  # TODO: this could be cleaned up. it returns an array an not an active record object
  scope :available, ->(date=Date.current) { (joins(:employee_ptos).where("employee_ptos.id IS NULL or employee_ptos.pto_date != ?", date) + where.missing(:employee_ptos)).uniq! }
end
