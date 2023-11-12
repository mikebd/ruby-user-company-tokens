FROM ruby:3.2

WORKDIR /app
COPY . .

CMD ["ruby", "test/test_json_parser.rb"]
