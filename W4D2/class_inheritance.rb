require "byebug"

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :servants

  def initialize(*args)
    super
    @servants = []
  end

  def add_servant(slave)
    servants << slave
  end

  def bonus(multiplier)




  servants.inject(0) { |sum, slave| sum+= (slave.is_a?(Manager) ? slave.bonus(1) + slave.salary : slave.salary) } * multiplier










    servants.inject(0) { |sum, slave| sum+=
                          (slave.is_a?(Manager) ?
                          slave.bonus(1) + slave.salary :
                          slave.salary) } * multiplier












    raw_bonus = servants.inject(0) do |sum, slave|
      sum += slave.is_a?(Manager) ? slave.bonus(1) + slave.salary : slave.salary)
    end
    raw_bonus * multiplier






    




    sum = 0
    raw_bonus = servants.each do |slave|
      if slave.is_a?(Manager)
        sum += slave.bonus(1)
      end
      sum += slave.salary
    end
    raw_bonus * multiplier









  end
end

ned = Manager.new("Ned", :Founder, 1000000, nil)
darren = Manager.new("Darren", :TA_Manager, 78000, ned)
shawna = Employee.new("Shawna", :slave, 12000, darren)
david = Employee.new("David", :slave, 10000, darren)
ned.add_servant(darren)
darren.add_servant(shawna)
darren.add_servant(david)

# puts ned.servants
# puts darren.servants
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000