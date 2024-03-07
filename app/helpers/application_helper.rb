# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'github', "https://github.com/#{author}/#{repo}",
            target: '_blank',
            rel: %w[nofollow noopener]
  end
end
