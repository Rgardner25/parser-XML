require 'active_support/core_ext/hash'
require 'rspec'

def macbeth_counter
  xml_data = File.open('support/macbeth.xml')
  hash = Hash.from_xml(xml_data)

  counter_hash = Hash.new { |h, k| h[k] = 0 }

  hash['PLAY']['ACT'].each do |k, v|
    k['SCENE'].each do |k2, v2|
      k2['SPEECH'].each do |k3, v3|
        counter_hash[k3['SPEAKER']] += Array(k3['LINE']).count
      end
    end
  end

  counter_hash
end
