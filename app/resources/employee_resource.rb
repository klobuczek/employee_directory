class EmployeeResource < ApplicationResource
  type :employees
  model Employee

  allow_stat total: [:count]

  allow_filter :first_name_prefix do |scope, value|
    scope.where('first_name like ?', "#{value}%")
  end

  allow_filter :last_name_prefix do |scope, value|
    scope.where('last_name like ?', "#{value}%")
  end

  has_many :positions,
    scope: -> { Position.all },
    foreign_key: :employee_id,
    resource: PositionResource
end
