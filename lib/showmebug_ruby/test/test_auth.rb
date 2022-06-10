require_relative '../authentication/auth.rb'
require 'pry'

options = {
  client_id: '4l5n95MYcmyUqcJ20BUw7TvAeiWbBRq8G6z6pO39vLo',
  client_secret: 'ke_UuPHN4nOC6opBmAcyc9NHCjwrP8E0GUru1hTEDL4',
  grant_type: "client_credentials"
}
client = ShowmebugRuby::Auth.new(options)
puts client.get_me()
puts client.get_exams()
puts client.get_exam_rooms()
puts client.get_written_questions(18820)
