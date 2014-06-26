class JSONParser
  NSUTF8StringEncoding = 4
  def self.parse_from_string(string)
    data = string.dataUsingEncoding NSUTF8StringEncoding
    parse_from_data data
  end
  
  def self.parse_from_data(data)
    error_ptr = Pointer.new(:object)
    json = NSJSONSerialization.JSONObjectWithData(data, options:0, error:error_ptr)
    unless json
      raise error_ptr[0]
    end
    json
  end
end

