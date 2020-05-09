class TicTacToe
  
  def initialize(board = nil)
  @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index.to_i)
  index.between?(0,8) && !position_taken?(@board[index])
end

def turn_count
counter = 0
  @board.each do |n|
    if n == "X" || n == "O"
      counter += 1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(@board, index)
    move(@board, index, current_player(@board))
    display_board(@board)
  else
    turn(@board)
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
  end
end
  
def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won?(@board) && full?(@board)
    return true
  else
    return false
  end
end

def over?
  if won?(@board) || full?(@board) || draw?(@board)
    return true
  else
    return false
  end
end

def winner
  if won?(@board) == false
    return nil
  else
    if board[won?(board)[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

end