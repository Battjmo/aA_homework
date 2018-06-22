class Map

attr_accessor :map

def initialize
  @map = []
end

def set(key, value)
  map.each do |el|
    if el[0] == key
      el[1] = value
      return
    end
  end
  new_entry = [key,value]
  map.push(new_entry)
end

def get(key)
  map.each { |el| return el if el[0] == key }
  nil
end

def delete(key)
  map.each do |el|
    if el[0] == key
      map.delete(el)
      return
    end
  end
  nil
end

def show
  puts "Map contents: "
  map.each do |el|
    puts el[0] + ", " + el[1]
  end
  puts "End of Map"
  nil
end


end
