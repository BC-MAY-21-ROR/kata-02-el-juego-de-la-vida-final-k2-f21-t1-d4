# frozen_string_literal: true

require 'rspec'
require_relative '../app/template'
require_relative '../app/cell'

describe Template do

  describe 'one_line_grid' do
    
    it 'check grid size' do
      template = Template.new(3, 8)
      template.generate
      expect(template.one_line_grid.size).to eq 24
    end

  end

  describe 'generate' do
    
    it 'check grid size of column' do
      template = Template.new(3, 8)
      expect(template.generate[0].size).to eq 8
    end

    it 'check grid size of rows' do
      template = Template.new(3, 8)
      expect(template.generate.size).to eq 3
    end
    
  end

end
