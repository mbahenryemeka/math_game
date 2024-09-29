require_relative 'question'

class Turn
  def initialize(player)
    @player = player
    @question = Question.new
  end

  def ask_question
    puts "#{@player.name}: #{@question.question_text}"
    print "> "
    answer = gets.chomp.to_i
    check_answer(answer)
  end

  def check_answer(answer)
    if answer == @question.correct_answer
      puts "#{@player.name}: YES! You are correct."
      @player.increment_score
    else
      puts "#{@player.name}: Seriously? No!"
      @player.lose_life
    end
  end
end