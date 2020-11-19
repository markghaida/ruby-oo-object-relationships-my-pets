require 'pry'


class Owner 

  attr_accessor
  attr_reader :name, :species  
  @@all = []  
  def initialize(name, species = "human")
    @name = name 
    @species = species 
    @@all << self 
  end 

  def say_species
    return "I am a human." 
  end 

  def self.all
    @@all 
  end 

  def self.count 
    # @@all.count # check out what @@all is
    self.all.count
  end 

  def self.reset_all
    self.all.clear 
  end 

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
    
    # Cat.all.select { |cat| cat.owner == self}
  end 

  def dogs 
    Dog.all.select { |dog| dog.owner == self}
  end 

  def buy_cat(cats_name)

    Cat.new(cats_name, self)

  #   When an owner buys a new pet, the `buy_cat/buy_dog` methods **take in an
  # argument of a _name_.** You must take that name and do the following:

  # - _Make a new instance of the appropriate pet, initializing it with that name
  #   and the owner who is purchasing it_.

  end 

  def buy_dog(dogs_name)
      Dog.new(dogs_name, self)
  end 
  
  ## ask for help. why dosnt it work###
  # def walk_dogs 
  #   Dog.all.select { |dog| dog.owner == self}
  #   dog.mood = "happy"
  # end 

  def walk_dogs
    Dog.all.select do |dog|
      dog.owner == self
      dog.mood = "happy"
    end
  end
  
  def feed_cats 
    Cat.all.select do |cat|
      cat.owner == self 
      cat.mood = "happy"
    end 
  end 

  def sell_pets 
      all_pets = Cat.all + Dog.all
      all_pets.select do |pet|
        pet.owner == self 
        pet.mood = "nervous"
      # binding.pry
        pet.owner = nil 
      end 
  end 

  def list_pets 
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end 