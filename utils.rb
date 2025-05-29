module Utils
  def self.parse_arguments(args)
    begin
      raise "No batch file provided" if args.empty?
      batch_file = args.first

      raise "Provided file '#{batch_file}' is not a batch file (.bat)" unless batch_file.end_with?('.bat')

      batch_file
    rescue => e
      puts "Error: #{e.message}"
      exit(1)
    end
  end
end
