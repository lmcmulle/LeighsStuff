# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

############# Leigh Code Follows
desc "Build scaffolds from existing db"
namespace :leigh do
task :useExistingDB => :environment do
  connection = ActiveRecord::Base.connection
  connection.tables.each do |table|
    begin

      command = "#{RAILS_ROOT}/script/generate"
      args = ["scaffold ","#{table} "]
      columns = ActiveRecord::Base.connection.columns(table)
      columns.each do |col|
        unless (col.name == "id")
            args << "#{col.name}:#{col.type} "
        end
      end
     puts "#{command} #{args.to_s}"
      system("#{command} #{args.to_s}")
      puts "generated '#{table}'"
    rescue
      puts "failed: #{$!}"
    end
  end
end
end

namespace :db do
  desc 'Create YAML test fixtures from data in an existing database.
  Defaults to development database. Set RAILS_ENV to override.'

  task :fixtures_extract => :environment do
    sql = "SELECT * FROM %s"
    skip_tables = ["schema_info", "sessions", "comments", "taggings", "tags", "rates", "ratings", "schema_migrations"]
    ActiveRecord::Base.establish_connection
    tables = ENV['FIXTURES'] ? ENV['FIXTURES'].split(/,/) : ActiveRecord::Base.connection.tables - skip_tables
    tables.each do |table_name|
      data = ActiveRecord::Base.connection.select_all(sql % table_name)
      if data.size > 0
      i = "000"  
      File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
        file.write data.inject({}) { |hash, record|
          hash["#{table_name}_#{i.succ!}"] = record
          hash
        }.to_yaml
      puts "Created / Updated Fixture for: '#{table_name}'"
    end
    end
  end
  puts "---Task Complete---"
end
end 

