require 'net/http'
require 'json'
require 'pry'

  class Issue
    ENDPOINT = "https://api.github.com/bobutcher/close_your_issues/issues"
    def list
      response = query_list
      return JSON.parse(response)
    end

    private

    def query_list
      uri = URI(ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new(uri.request_uri)
      req.basic_auth(ENV['GITHUB_USER'], ENV['GITHUB_PASSWORD'])
      response = http.request(req).body
    end
  end
