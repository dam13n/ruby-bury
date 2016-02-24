class Hash
  
  def bury *args
    if args.count < 2
      raise ArgumentError.new("2 or more arguments required")
    elsif args.count == 2
      self[args[0]] = args[1]
    else
      arg = args.shift
      self[arg] = {} unless self[arg]
      self[arg].bury(*args) unless args.empty?
    end
    self
  end
end
