class Player
  attr_reader :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def lose_life
    @lives -= 1
  end

  def increment_score
    @score += 1
  end

  def to_s
    "#{@name}: #{@score}/3 with #{@lives} lives remaining"
  end
end