namespace :db do
  desc 'Create a schemas on DB (test, dev and prd)'
  task 'create-schema' do
    `mysql -u root -p < db/setup_mysql.sql`
  end

  desc 'Show db info'
  task :config do
    puts "\n\s==========================="
    puts "\s\sDB Config"
    puts "\s==========================="
    puts "\s\s-\sHostname: #{ENV['DB_HOSTNAME']}"
    puts "\s\s-\sUsername: #{ENV['DB_USERNAME']}"
    puts "\s\s-\sPassword: #{ENV['DB_PASSWORD']}"
    puts "\s==========================="
  end
end
