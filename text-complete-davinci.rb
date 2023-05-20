require "openai"

client = OpenAI::Client.new(api_key: "your-api-key")


response = client.completions(
  # engine: "curie",
  engine: "davinci",
  prompt: "Hello I would like to ask you about",
  temperature: 0.7,
  max_tokens: 50,
  top_p: 1,
  frequency_penalty: 0,
  presence_penalty: 0,
  stop: "\n"
)

puts response.choices[0].text
# puts response.inspect
