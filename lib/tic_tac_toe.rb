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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if (0..8).include?(index) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn_count(board)
  board.select do |index|
    index != " " && index != nil
  end.count
end

def turn(board)
  puts "Pick a position from 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    char = current_player(board)
    move(board, index, char)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != nil && board[combo[0]] != " "
      return true
    end
  end
  false
end
  