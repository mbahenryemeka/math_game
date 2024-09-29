require_relative 'player'
require_relative 'turn'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start
    until game_over?
      Turn.new(@current_player).ask_question
      display_scores
      switch_turns
      puts "----- NEW TURN -----" unless game_over?
    end
    puts game_over_message
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def display_scores
    puts @player1.to_s
    puts @player2.to_s
  end

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def game_over_message
    winner = (@player1.lives > 0) ? @player1 : @player2
    "----- GAME OVER -----\n#{winner.name} wins with a score of #{winner.score}/3\nGood bye!"
  end