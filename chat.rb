require "openai"

client = OpenAI::Client.new(api_key: "your-api-key")

# conversation = [
#   { role: 'system', content: 'You are a helpful assistant.' },
#   { role: 'user', content: 'Who won the World Series in 2020?' }
# ]

# prompt = "give me the name and birth date of the 4 members of the band the Beatles in a an array containing an object for each member with the keys: name and date"
prompt = "what are the 5 tallest building in the world"

response = client.completions(
  engine: "text-davinci-003",
  # prompt: conversation.map { |message| "#{message[:role]}: #{message[:content]}" }.join("\n"),
  prompt: prompt,
  temperature: 0.7,
  max_tokens: 250,
  n: 1,
  stop: nil
)

puts response.choices[0].text
