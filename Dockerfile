FROM ruby:3.2

WORKDIR /app
COPY . .

CMD ["ruby", "test_JSONParser.rb"]
