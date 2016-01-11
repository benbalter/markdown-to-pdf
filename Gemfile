source "https://rubygems.org"

gem "sinatra"
gem "octokit"
gem "pdfkit"
gem "dotenv"
gem "rack-ssl-enforcer"
gem "foreman"

group :production do
  gem 'wkhtmltopdf-heroku'
end

group :development, :test do
  gem 'wkhtmltopdf-binary-edge'
end

group :test do
  gem "rake"
  gem "vcr"
  gem "shoulda"
  gem "bundler"
  gem "webmock"
  gem "rack-test"
end
