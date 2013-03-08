class Line

  attr_reader :name, :id

  def initialize(name,id=0)
    @name = name
    @id = nil
  end


  def save
    @id = DB.exec("INSERT INTO line (name) VALUES ('#{name}') RETURNING id;").first['id']
  end

  def view
    DB.exec("SELECT station.name 
            FROM station, stop 
            WHERE #{@id} = stop.line_id 
            AND station.id = stop.station_id;").inject([]) {|stuff, stuff_hash| stuff << Station.new(stuff_hash['name'],stuff_hash['id']) }
  end
  
  def self.all
    DB.exec("SELECT * FROM line;").inject([]) { |line, line_hash| line << Line.new(line_hash['name']) }
  end


end
