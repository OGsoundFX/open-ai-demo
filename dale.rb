require "net/http"
require "json"

api_key = "your-api-key"
url = URI.parse("https://api.openai.com/v1/images/generations")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url.path)
request["Content-Type"] = "application/json"
request["Authorization"] = "Bearer #{api_key}"
request.body = {
  prompt: "the mona lisa with a cat",
  n: 4,
  size: "256x256"
}.to_json

response = http.request(request)

if response.code == "200"
  image_data = JSON.parse(response.body)
  # more then 1 image
  image_data["data"].each { |image| puts image["url"]}
  # 1 image
  image_url = image_data["data"][0]["url"]
  # puts image_url
else
  puts "Error: #{response.body}"
end
