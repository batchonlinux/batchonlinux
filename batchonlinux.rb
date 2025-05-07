require_relative '../lib/batch_runner'
require_relative '../lib/utils'

begin
  # Parancssori argumentumok feldolgozása
  batch_file = Utils.parse_arguments(ARGV)
  
  # Batch fájl futtatása
  BatchRunner.run(batch_file)
rescue => e
  puts "Error: #{e.message}"
  exit(1)
end
