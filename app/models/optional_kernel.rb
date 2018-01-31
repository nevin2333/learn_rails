class OptionalKernel
  def method_missing(method, *args)
    p "You called: #{method}(#{args.join(', ')})"
    p "(You also passed it a block)"  if block_given?
  end
end