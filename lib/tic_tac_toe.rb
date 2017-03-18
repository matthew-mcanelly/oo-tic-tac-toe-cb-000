# Tic Tac Toe class

class TicTacToe

  # Array of possible win combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # Initialize Class
  def initialize
    @board = Array.new(9, " ")
  end

  # Displays the board state
  def display_board
    first_row = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    second_row = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    third_row = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    row_seperator = "-----------"
    board = "#{first_row}\n"\
            "#{row_seperator}\n"\
            "#{second_row}\n"\
            "#{row_seperator}\n"\
            "#{third_row}"
    puts board
  end

  # Turns the user input into a valid array index
  def input_to_index(input)
    offset = input.to_i - 1
    return offset
  end

  # Records players move on the board array
  def move(move, player="X")
    @board[move] = player
  end

  # Determines if a board position is taken
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Determines whether a players choice is a valid move
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  # Determines current turn
  def turn_count
    turn = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turn += 1
      end
    end
    return turn
  end

  # Determines current player
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  # Plays through a single turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    until valid_move?(index)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end

  # Determines if the game is won. 
  def won?
    WIN_COMBINATIONS.detect do |win|
    @board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]] &&
    position_taken?(win[0])
    end
  end

  # Determines if the board is full
  def full?
   @board.all? do |position|
     position == "X" || position == "O"
   end
  end

  # Determines if the game is a draw
  def draw?
    !won? && full?
  end

  # Determines if the game is over
  def over?
    draw? || won?
  end

  # Determines the winner
  def winner
    if won = won?
      @board[won[0]]
    end
  end

  # Plays through a game
  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end