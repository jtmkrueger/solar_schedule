30.times do
  Employee.create!(employee_type: rand(0..2))
end

10.times do
  EmployeePto.create!(
    employee_id: rand(1..10),
    pto_type: rand(0..2),
    pto_date: rand(3.days).seconds.from_now.to_date
  )
end

30.times do
  Building.create!(building_type: rand(0..2))
end

puts "Employees: #{Employee.count}"
puts "EmployeePtos: #{EmployeePto.count}"
puts "Buildings: #{Building.count}"
