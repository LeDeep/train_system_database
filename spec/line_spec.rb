require 'spec_helper'

describe Line do 
  context '#initialize' do 
    it 'initializes a line name as an argument' do
     line = Line.new('Blue').should be_an_instance_of Line
    end
  end

  context "#save" do
    it 'saves a line to the database' do
      line = Line.new('Blue')
      line.save
    end
  end

  context ".all" do
    it 'returns an array of all the lines' do
      lines = [Line.new('Blue'), Line.new('Red'),Line.new('Green')]
      lines.each { |line| line.save }
      Line.all.length.should eq 3
      Line.all.first.should be_an_instance_of Line
    end
  end

  context '#view' do 
    it 'returns an array of stations for a particular line' #do 
    #   stop = {'line' => 'Blue', 'station' => 'Washington'}
    #   line = Line.view(stop)
    #   line.save
    #   line.view(stop).should eq 'Washington'
    # end
  end


end
