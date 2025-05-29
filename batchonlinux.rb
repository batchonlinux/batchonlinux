require_relative '../lib/batch_runner'
require_relative '../lib/utils'

begin
  batch_file = Utils.parse_arguments(ARGV)
  
  BatchRunner.run(batch_file)
rescue => e
  puts "Error: #{e.message}"
  exit(1)
end
