require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'json', require: false
  gem 'nap', require: 'rest'
  gem 'cocoapods', '~> 0.34.1'
end

puts 'Gems installed and loaded!'
puts "The nap gem is at version #{REST::VERSION}"

# from https://bundler.io/guides/bundler_in_a_single_file_ruby_script.html

