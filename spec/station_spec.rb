require 'spec_helper'

describe Station do 
  context '#initialize' do 
    it 'initializes a station name as an argument' do
     station = Station.new('Washington').should be_an_instance_of Station
    end
  end

  context "#save" do
    it 'saves a station to the database' do
      station = Station.new('Blue')
      station.save
    end
  end

  context ".all" do
    it 'returns an array of all the stations' do
      stations = [Station.new('test'), Station.new('Red'),Station.new('Green')]
      stations.each { |station| station.save }
      Station.all.length.should eq 3
      Station.all.first.should be_an_instance_of Station
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
