class Employee

  attr_reader :salary
    # def initialize(*args)
    # @name = args[0]
    # @title = args[1]
    # @salary = args[2]
    # @boss = args[3]

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

end

class Manager < Employee
  # Same as def initialize(name, title, salary, boss)
  attr_reader :slaves
  # Variation of the no-raise error.
  # def initialize(employees, *args)
  #   super(*args)
  #   @slaves = employees
  #   raise if @slaves.empty?
  # end

  def initialize(*args)
    super(*args)
    # Employee.initialize(name, title, salary, boss)
    @slaves = []
  end

  def add_slave(employee)
    @slaves << employee
  end

  def bonus(multiplier)
    total = 0

    @slaves.each do |employee|
      if employee.is_a?(Manager)
        total += employee.bonus(1)
      end
      total += employee.salary
    end

    total * multiplier
  end

end

zoe = Manager.new("Pres", "President", 1, nil)
ned = Manager.new("ned", "Founder", 100, "pres")
shawna = Employee.new("shawna", "TA", 12, "darren")
david = Employee.new("david", "TA", 10, "darren")
darren = Manager.new("darren", "TA manager", 78, "ned")

zoe.add_slave(ned)
ned.add_slave(darren)
darren.add_slave(shawna)
darren.add_slave(david)

# p ned
# p shawna
# p david
# p darren

p david.bonus(3)
p darren.bonus(4)
p ned.bonus(1)
p zoe.bonus(1)

p "---------"

p "David bonus(1): #{david.bonus(1)}"
p "David salary: #{david.salary}"
p "Shawna salary: #{shawna.salary}"
p "Daren bonus(1): #{darren.bonus(1)}"
p "Daren salary: #{darren.salary}"
p "Ned bonus(1): #{ned.bonus(1)}"
p "Zoe bonus(1): #{zoe.bonus(1)}"