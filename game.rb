class Game

  attr_accessor :current_player, :num1, :num2 , :user_answer, :sum
  
  # get names of players
  def initialize
    puts "Player 1, please enter your name:"
    @player1 = Player.new(gets.chomp)
    puts "Player 2, please enter your name:"
    @player2 = Player.new(gets.chomp)
    @current_player = @player1

  end

  # switch current player
  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  # generate question
  def question
    @num1 = rand(1..20)
    @num2 = rand(1..20)

    @sum = self.num1 + self.num2

    puts "#{@current_player.name}: What does #{@num1} plus #{@num2} equal?"

    @answer = gets.chomp.to_i
  end

  # start round and check answers
  def start
    while @player1.lives != 0 && @player2.lives != 0
      puts "----- NEW TURN -----"
      question
      if @answer == @sum
        puts "#{@current_player.name}: YES! You are correct."
        puts "P1: #{@player1.lives}/3 vs P@: #{@player2.lives}/3"
        switch_player
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
        switch_player
      end
    end

    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
    else
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
    end

    puts "----- GAME OVER -----"
    puts "Good bye!"

  end

end