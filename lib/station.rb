class Station

  attr_reader :name, :id

  def initialize(name,id=0)
    @name = name
    @id = nil
  end


  def save
    @id = DB.exec("INSERT INTO station (name) VALUES ('#{name}') RETURNING id;").first['id']
  end

  def self.all
    DB.exec("SELECT * FROM station;").inject([]) { |station, station_hash| station << Station.new(station_hash['name']) }
  end

  def view
    DB.exec("SELECT line.name 
            FROM line, stop 
            WHERE #{@id} = stop.station_id 
            AND line.id = stop.line_id;").inject([]) {|stuff, stuff_hash| stuff << Station.new(stuff_hash['name'],stuff_hash['id']) }
  end

end
