# frozen_string_literal: true

require 'rspec'
require_relative '../app/cell'
require_relative '../app/template'

describe Cell do
  
  before(:all) do
    @new_grid = [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]
  end

  describe 'generate_cells' do

    it 'check generate cells' do
      grid = Template.new(4, 8)
      cell = Cell.new(grid.grid)
      cell.generate_cells
      expect(grid.one_line_grid.include?(1)).to eq true
    end

  end

  describe 'count_neighbors' do
    
    it 'check count neighbours' do
      cell = Cell.new(@new_grid)
      expect(cell.count_neighbors.sum).to eq 24
    end
    
    it 'should be count correctly the neighbors' do
      cell = Cell.new(@new_grid)
      print @new_grid
      neighbors = cell.count_neighbors
      expect(neighbors.to_a).to eq([[0, 0, 0, 1, 1, 1, 0, 0], [0, 0, 1, 3, 2, 2, 0, 0], [0, 0, 1, 2, 2, 2, 0, 0], [0, 0, 1, 2, 2, 1, 0, 0]])
    end

  end

  describe 'lives_or_dies' do

    it 'check live or die' do
      cell = Cell.new(@new_grid)
      cell.count_neighbors
      cell.lives_or_dies
      expect(@new_grid).to eq([[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0],
                              [0, 0, 0, 0, 0, 0, 0, 0]])
    end

  end

  describe 'change_value' do

    it 'should be the new value' do
      cell = Cell.new(@new_grid)
      cell.change_value(2, 2, 1)
      expect(cell.grid[2][2]).to eq(1)
    end

  end

end
# 00000000
# 00001000
# 00011000 
# 00000000

# 00000000
# 00000100
# 00001100 
# 00000000

# 00001110
# 00003230
# 00012220
# 00012210
