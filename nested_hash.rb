  
  #ref : http://stackoverflow.com/questions/8748475/iterate-over-an-deeply-nested-level-of-hashes-in-ruby

 
 
 
 
 h={a: 1, b: 2, c: {x: {state: 'TX', country: 'USA'}, y: 20}, d: 4, e: {f: {g: {k: 'end'}}}} 
  def nested_hash(h)
  h.each do |key,value|
   #if value===?(h) ### if value is again a hash is true have to print the values of hash within a  hash
      # nested_hash(value)
   #else
     # puts "#{value}"
    if value.is_a?(Hash) ### if value is again a array of nested hash, print the values of that nested hash until there are no keys left
	  nested_hash(value)
	else
	  
      puts "#{value}"
    
   end
 end
end
nested_hash(h)


