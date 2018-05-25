require_relative 'tree_node.rb'
require 'byebug'

class KnightPathFinder

  def initialize(pos = [0,0])
    @start_pos = pos
    @visited = [pos]
    @move_tree = PolyTreeNode.new(@start_pos)
  end

  def build_move_tree
    queue = [@move_tree]
    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value
      new_moves = new_move_positions(current_pos)
      unless new_moves.nil?
        new_moves.each do |move|
          new_node = PolyTreeNode.new(move)
          current_node.add_child(new_node)
        end
      end
      queue += current_node.children unless current_node.children.nil?
    end
  end

  def valid_moves(pos)
    x,y = pos
    moves = []
    moves << [x-2,y-1]
    moves << [x-2,y+1]
    moves << [x+2,y-1]
    moves << [x+2,y+1]
    moves << [x+1,y+2]
    moves << [x+1,y-2]
    moves << [x-1,y+2]
    moves << [x-1,y-2]

    moves.select { |move| valid_pos?(move) }
  end

  def valid_pos?(pos)
    return false if pos[0] < 0 || pos[0] > 7
    return false if pos[1] < 0 || pos[1] > 7
    true
  end

  def new_move_positions(pos)
    moves = valid_moves(pos)
    moves.reject! { |move| @visited.include?(move)}
    @visited += moves unless moves.nil?
    moves
  end

  def find_path(end_pos)
    @move_tree.bfs(end_pos)
  end

  attr_reader :move_tree

end

knight = KnightPathFinder.new([0,0])
# knight.new_move_positions([0,0])
knight.build_move_tree
p knight.move_tree
