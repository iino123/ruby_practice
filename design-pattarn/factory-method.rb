require "bundler/setup"
require "pry-byebug"

# Product(ConcreteFactoryによって生成されるオブジェクト)
class Duck
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def speak
    puts "アヒル#{name}はガーガー鳴いてます"
  end

  def eat
    puts "アヒル#{name}は食事中です"
  end
end

# Product(ConcreteFactoryによって生成されるオブジェクト)
class Frog
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def speak
    puts "カエル#{name}はケロケロ鳴いてます"
  end

  def eat
    puts "カエル#{name}は食事中です"
  end
end


# Creator:共通部分の処理を行う(ConcreteCreator(DuckPondやFrogPond)の共通部分の処理を行う)
class Pond
  def initialize(n_a)
    @a = []
    binding.pry
    n_a.times do |i|
      binding.pry
      a = new_animial("動物#{i}") # このnew_animalがfactory_methodにあたる、処理はConcreteCreatorの実装したメソッドが行う
      @a << a
    end
  end

  def simulate_one_day
    @a.each {|a| a.speak }
    @a.each {|a| a.eat }
  end
end

# PondFactory(ConcreteCreator)
class DuckPond < Pond
  def new_animial(name) # factory_method
    Duck.new(name)
  end
end

# FrogFactory(ConcreteCreator)
class FrogPond < Pond
  def new_animial(name)  # factory_method
    Frog.new(name)
  end
end

pond = FrogPond.new(3) 
pond.simulate_one_day


