class QueryController < ApplicationController
  require "uri"
  require "json"
  require "net/http"

  def querier
    url = URI("https://dev.api.etnamed.ru/v1/graphql")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = "{\"query\":\"mutation M {\\n  dmsCreateOrderNumber {\\n    order_id\\n  }\\n}\",\"variables\":{}}"

    response = https.request(request)
    puts response.read_body
    res = JSON.parse(response.read_body)
  end
end
