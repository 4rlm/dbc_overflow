require 'bundler'
Bundler.require

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'dbc_overflow',
    pool: 5
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'dbc_overflow',
    pool: 5
  }
end

require_all 'app'

