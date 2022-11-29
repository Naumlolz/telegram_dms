# frozen_string_literal: true

require 'telegram/bot'

token = '5672148721:AAHegNZ5zfA0r31hhEqSy9TviiMoZQzq8eE'

Telegram::Bot::Client.run(token, enviroment: :test) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/end'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}!")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "I don't understand you :(")
    end
  end
end
