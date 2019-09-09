require_relative "00_tree_node"

class KnightPathFinder
    attr_reader :root_node, :considered_positions

    def self.valid_moves(position)
        # Board is always 8x8 regular Chess board.
        #       [-1, 2]       [1,2]
        # [-2, 1]                   [2,1]
        #               [0,0]
        # [-2, -1]                  [2, -1]
        #       [-1, -2]      [1, -2]     
        valid_moves = []
        
        valid_moves << KnightPathFinder.combine_moves(position.value, [2,1])
        valid_moves << KnightPathFinder.combine_moves(position.value, [1,2])
        valid_moves << KnightPathFinder.combine_moves(position.value, [2,-1])
        valid_moves << KnightPathFinder.combine_moves(position.value, [-1,2])
        valid_moves << KnightPathFinder.combine_moves(position.value, [-2,1])
        valid_moves << KnightPathFinder.combine_moves(position.value, [1,-2])
        valid_moves << KnightPathFinder.combine_moves(position.value, [-2,-1])
        valid_moves << KnightPathFinder.combine_moves(position.value, [-1,-2])

        valid_moves.reject { |pos| pos.first < 0 || pos.first > 7 }
                   .reject { |pos| pos.last < 0 || pos.last > 7 } 
    end

    def self.combine_moves(position1, position2)
        [position1.first + position2.first, position1.last + position2.last]
    end

    def initialize(position_array)
        @root_node = PolyTreeNode.new(position_array)
        @considered_positions = [root_node]
        build_move_tree(root_node)
    end

    def new_move_positions(position)
        possible_moves = KnightPathFinder.valid_moves(position)
        possible_moves = possible_moves.reject { |move| considered_positions.include?(move) }
        considered_positions += possible_moves
        possible_moves
    end

    def find_path
    end

    private
    attr_writer :considered_positions

    def build_move_tree(initial_position)
        # .reject considered_positions
    end
end

knight = KnightPathFinder.new([0,0])
p knight.root_node
p "Possible Moves: "
p KnightPathFinder.valid_moves(knight.root_node)
p KnightPathFinder.valid_moves(PolyTreeNode.new([5,6]))
p KnightPathFinder.valid_moves(PolyTreeNode.new([3,3]))