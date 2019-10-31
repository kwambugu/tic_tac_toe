class Game

  def initialize()
    @squares = {'1' => '1', '2' => '2', '3' => '3', '4' => '4', '5' => '5', 
    '6' => '6', '7' => '7', '8' => '8', '9' => '9'}
    @round = 1
    @game_over = false
  end

  def game_over?
    if @squares['1'] == @squares['2'] && @squares['2'] == @squares['3'] ||
       @squares['4'] == @squares['5'] && @squares['5'] == @squares['6'] ||
       @squares['7'] == @squares['8'] && @squares['8'] == @squares['9'] ||
       @squares['1'] == @squares['4'] && @squares['4'] == @squares['7'] ||
       @squares['2'] == @squares['5'] && @squares['5'] == @squares['8'] ||
       @squares['3'] == @squares['6'] && @squares['6'] == @squares['9'] ||
       @squares['1'] == @squares['5'] && @squares['5'] == @squares['9'] ||
       @squares['3'] == @squares['5'] && @squares['5'] == @squares['7']
        @game_over = true
    end
  end
  
  def play_game()
    board()
    while @round < 10 && @game_over == false
      if @round%2 == 0
        puts "Player O's turn."
        play_round('0')
      else
        puts "Player X's turn."
        play_round('X')
      end
    end
    if @round == 10 && @game_over == false
        puts "CAT'S GAME!!!!"
    elsif @game_over == true && @round % 2 == 0
        puts "Player X wins!!!!!!"
    else
        puts "Player O wins!!!!!!"
    end
  end

  def play_round(team)
      print "Please select the square you'd like to play: "
      place = gets.chomp
      puts
      if @squares[place].to_i > 0
        @squares[place] = team
        @round += 1
      else
        puts "****************************************"
        puts "Choose a square that hasn't been chosen."
        puts "****************************************"
        puts
      end
      board()
      game_over?()
  end
 
  def board()
    puts " #{@squares['1']} | #{@squares['2']} | #{@squares['3']} "
    puts "-----------"
    puts " #{@squares['4']} | #{@squares['5']} | #{@squares['6']} "
    puts "-----------"
    puts " #{@squares['7']} | #{@squares['8']} | #{@squares['9']} "
    puts
  end
end
x = Game.new
x.play_game