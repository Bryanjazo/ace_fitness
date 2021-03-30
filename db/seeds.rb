require 'resolv-replace'
require 'httparty'
response = HTTParty.get("https://wger.de/api/v2/exercise/?format=json&language=2&limit=20&offset=60")
new_response = response.parsed_response


new_response["results"].each do |hash|
  Workout.create(work_out: hash["name"],description: hash["description"])
end
