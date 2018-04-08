# encoding: UTF-8

app_path = File.expand_path(File.dirname(__FILE__) + '/..')
current_path = '/var/www/talent_fore/current'
shared_path  = '/var/www/talent_fore/shared'
pid_file     = shared_path + '/tmp/pids/unicorn.pid'
pid shared_path + '/tmp/pids/unicorn.pid'

# The number of worker processes you have here should equal the number of CPU
# cores your server has.
worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)

# You can listen on a port or a socket. Listening on a socket is good in a
# production environment, but listening on a port can be useful for local
# debugging purposes.
listen shared_path + '/tmp/sockets/unicorn.sock', backlog: 64

# After the timeout is exhausted, the unicorn worker will be killed and a new
# one brought up in its place. Adjust this to your application's needs. The
# default timeout is 60. Anything under 3 seconds won't work properly.
timeout 300

# Set the working directory of this unicorn instance.
working_directory current_path

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

# Load the app up before forking.
preload_app true

# Garbage collection settings.
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
