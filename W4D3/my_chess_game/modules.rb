module Slideable
  def moves
    
  end
# p "Position: #{pos}"
  def horizontal_moves
    HORIZONTAL_DIRS.map { |delta| [pos.first + delta.first, pos.last + delta.last] }
  end

  def diagonal_moves
    DIAGONAL_DIRS.map { |delta| [pos.first + delta.first, pos.last + delta.last] }
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
end