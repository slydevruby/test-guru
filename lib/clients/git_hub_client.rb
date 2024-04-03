# frozen_string_literal: true

require 'octokit'

class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  def initialize
    @client = setup_http_client
  end

  def create_gist(params)
    @client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV.fetch('GIT_TOKEN', nil))
  end
end
