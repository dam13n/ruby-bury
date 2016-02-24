class Array
  
  def bury *args
    if args.count < 2
      raise ArgumentError.new("2 or more arguments required")
    elsif args.count == 2
      if args[0].is_a? Integer
        self[args[0]] = args[1]
      else
        self << { args[0] => args[1] }
      end
    else
      if args[0].is_a? Integer
        arg = args.shift
        self[arg] = [] unless self[arg]
        self[arg].bury(*args)
      else
        self << Hash.new.bury(*args)
      end
    end
    self
  end
end
