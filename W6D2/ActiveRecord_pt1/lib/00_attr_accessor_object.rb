class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |symbol|
      define_method(symbol) { instance_variable_get("@#{symbol}") }
      define_method("#{symbol}=") { |value| instance_variable_set("@#{symbol}", value)}
    end
  end
end