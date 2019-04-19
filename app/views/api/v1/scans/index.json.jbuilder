json.scans do

json.array! @scans do |scan|
  json.extract! scan,  :food

  end
end

