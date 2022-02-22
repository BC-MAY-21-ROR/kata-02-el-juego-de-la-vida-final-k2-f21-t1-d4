# frozen_string_literal: true

require 'rspec'
require_relative '../app/cell'
require_relative '../app/template'

describe Cell do
  
  new_grid = [[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0]]

  it 'check generate cells' do
    grid = Template.new(4, 8)
    cell = Cell.new(grid.grid)
    cell.generate_cells
    expect(grid.one_line_grid.include?(1)).to eq true
  end

  it 'check count neighbours' do
    cell = Cell.new(new_grid)
    expect(cell.count_neighbors.sum).to eq 24
  end

  it 'check live or die' do
    cell = Cell.new(new_grid)
    cell.count_neighbors
    cell.lives_or_dies
    expect(new_grid).to eq([[0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 1, 0, 0, 0],
                        [0, 0, 0, 0, 0, 0, 0, 0]])
  end
end

# 00000000
# 00000100
# 00001100
# 00000000

# 00001110
# 00003230
# 00012220
# 00012210
