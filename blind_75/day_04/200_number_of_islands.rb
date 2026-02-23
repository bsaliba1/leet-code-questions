# 200. Number of Islands
# Link: https://leetcode.com/problems/number-of-islands/
# Difficulty: Medium

# Faster solution
def num_islands(grid)
  visited = Hash.new(false)
  number_of_islands = 0
  grid.each_with_index do |arr, x|
    arr.each_index do |y|
      next if visited[[x, y]] || grid[x][y] != '1'

      number_of_islands += 1
      explore_island(grid, visited, x, y)
    end
  end
  number_of_islands
end

def explore_island(grid, visited, x, y)
  return if visited[[x, y]] || x < 0 || y < 0 || x >= grid.length || y >= grid[0].length || grid[x][y] != '1'

  visited[[x, y]] = true
  explore_island(grid, visited, x + 1, y) # down
  explore_island(grid, visited, x - 1, y) # up
  explore_island(grid, visited, x, y - 1) # left
  explore_island(grid, visited, x, y + 1) # right
end

# SLOW SOLUTION
# @param {Character[][]} grid
# @return {Integer}
def num_islands_slow(grid)
  visited = Hash.new(false)
  number_of_islands = 0
  land_starting_coordinates = find_land_slow(grid, visited)
  while land_starting_coordinates
    number_of_islands += 1
    explore_island_slow(grid, visited, land_starting_coordinates[0], land_starting_coordinates[1])
    land_starting_coordinates = find_land(grid, visited)
  end
  number_of_islands
end

def find_land_slow(grid, visited)
  grid.each_with_index do |arr, x|
    arr.each_index do |y|
      next if visited[[x, y]]
      return [x, y] if grid[x][y] == '1'
    end
  end
  nil
end

def explore_island_slow(grid, visited, x, y)
  return if visited[[x, y]] || x < 0 || y < 0 || x >= grid.length || y >= grid[0].length || grid[x][y] != '1'

  visited[[x, y]] = true
  explore_island_slow(grid, visited, x + 1, y) # down
  explore_island_slow(grid, visited, x - 1, y) # up
  explore_island_slow(grid, visited, x, y - 1) # left
  explore_island_slow(grid, visited, x, y + 1) # right
end
