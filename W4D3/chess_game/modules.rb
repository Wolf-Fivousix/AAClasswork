module Slideable
  def moves
    
  end
# p "Position: #{pos}"
  def horizontal_dirs
    HORIZONTAL_DIRS.select { |delta| inside_board?(delta) }
  end

  def diagonal_dirs
    DIAGONAL_DIRS.select { |delta| inside_board?(delta) }
  end

  def inside_board?(delta)
    possible_position = [pos.first + delta.first, pos.last + delta.last]
    
    return false if possible_position.first < 0 || possible_position.first > 7
    return false if possible_position.last < 0 || possible_position.last > 7

    true
  end

  private
  HORIZONTAL_DIRS = [
                      [0,1], [0,-1], [1,0],[-1,0],
                      [0,2], [0,-2], [2,0],[-2,0],
                      [0,3], [0,-3], [3,0],[-3,0],
                      [0,4], [0,-4], [4,0],[-4,0],
                      [0,5], [0,-5], [5,0],[-5,0],
                      [0,6], [0,-6], [6,0],[-6,0],
                      [0,7], [0,-7], [7,0],[-7,0]
                    ]
  DIAGONAL_DIRS = [
                      [1,1], [-1,-1], [1,-1],[-1,1],
                      [2,2], [-2,-2], [2,-2],[-2,2],
                      [3,3], [-3,-3], [3,-3],[-3,3],
                      [4,4], [-4,-4], [4,-4],[-4,4],
                      [5,5], [-5,-5], [5,-5],[-5,5],
                      [6,6], [-6,-6], [6,-6],[-6,6],
                      [7,7], [-7,-7], [7,-7],[-7,7]
                  ]

  def move_dirs(maneuverability)
    raise "Implement me, Darnt it!"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    # ?????
  end
end

module Stepable
end