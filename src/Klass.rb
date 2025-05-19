class Person
  # attr_writer :age
  def initialize(name, age)
    @name = name
    @age = age
  end

  def info
    @name + "," + @age.to_s
  end

  def set_age x
    @age = x
  end
end

p  = Person.new("Syun", 18)
puts p.info

p.set_age(20)
puts p.info
