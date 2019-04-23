json.statisitics do

json.array! @statisitics do |scan|
  json.extract! scan, :food

  end
end
