$chain_lengths = {:largest_num => 0, :largest_chain => 0, 1 => 1, 2 => 2}

def get_chain_length_for(n)
    return $chain_lengths[n] if $chain_lengths.has_key?(n)
      next_n = 3 * n + 1 if n.odd?
        next_n = n / 2 if n.even?
          return ($chain_lengths[next_n] = get_chain_length_for(next_n)) + 1
end

(2..999999).each do |x|
    len = get_chain_length_for(x)
      $chain_lengths[x] = len
        if len > $chain_lengths[:largest_chain]
              $chain_lengths[:largest_num]   = x
                  $chain_lengths[:largest_chain] = len
                    end
end
puts $chain_lengths[:largest_num]
puts $chain_lengths[:largest_chain]
