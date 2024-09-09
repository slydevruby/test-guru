# frozen_string_literal: true

json.extract! rule, :id, :title, :category_id, :created_at, :updated_at
json.url rule_url(rule, format: :json)
