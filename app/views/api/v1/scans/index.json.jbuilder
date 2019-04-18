json.scans do

json.array! @scans do |scan|
  json.extract! scan, :user_id, :food

  end
end

