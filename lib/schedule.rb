class Schedule
  def initialize
    @buildings = Building.all.to_a
    @schedule = {
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
    }
  end

  def run
    @schedule.keys.each_with_index do |day, i|
      employees = Employee.available(Date.current + i.days)
      iterate_buildings(employees, day)
    end

    puts @schedule.inspect
    @schedule.inspect
  end

  private

  def iterate_buildings(employees, day)
    filtered_employee_ids = []
    @buildings.each do |building|
      filled = find_employees(
        building,
        employees.filter { |el| filtered_employee_ids.exclude?(el.id) },
        day
      )
      filtered_employee_ids.push(@schedule[day].last[:crew]).flatten! if filled
      @buildings.slice!(@buildings.index(building)) if filled
    end
  end

  def find_employees(building, employees, day)
    openings = building.crew_makeup
    crew = []

    employees.each do |employee|
      employee_type = employee.employee_type.to_sym

      # can they fill a required role?
      # TODO: refactor this to a method
      if openings[:required][employee_type] && openings[:required][employee_type] > 0
        openings[:required][employee_type] -= 1
        crew << employee.id
      # can they fill a pool role?
      # TODO: refactor this to a method
      elsif openings[:pool][:types].include?(employee_type) && openings[:pool][:total] > 0
        openings[:pool][:total] -= 1
        crew << employee.id
      end
    end

    if openings[:required].values.all? { |v| v == 0 } && openings[:pool][:total] == 0
      @schedule[day] << { building: building.id, crew: crew }

      return true
    else
      return false
    end
  end
end

