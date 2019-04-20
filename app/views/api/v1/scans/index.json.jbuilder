json.scans do

json.array! @scans do |scan|
  json.extract! scan, :id, :food

  end
end

