class EmployeeResource < ApplicationResource
  use_adapter JsonapiCompliable::Adapters::Null

  type :employees
  model Employee

  allow_filter :first_name_prefix do |scope, value|
    scope.condition(:first_name).starts_with(value)
  end

  allow_sideload :positions, resource: PositionResource do
    scope do |employees|
      search = PositionSearch.new
      search.condition(:employee_id).or(employees.map(&:id))
    end

    assign do |employees, positions|
      employees.each do |employee|
        employee.positions = positions
          .select { |p| p.employee_id == employee.id }
      end
    end
  end

  def resolve(scope)
    scope.query!
    scope.results
  end
end
