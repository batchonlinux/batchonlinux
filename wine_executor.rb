module WineExecutor
  def self.run(batch_file)
    begin
      puts "Running batch file '#{batch_file}' using Wine..."
      # Ellenőrizzük, hogy létezik-e a wine
      raise "Wine is not installed or not in the PATH" unless system("which wine > /dev/null 2>&1")

      # Próbálkozunk a batch fájl futtatásával
      success = system("wine cmd /c #{batch_file}")
      raise "Failed to execute batch file with Wine" unless success
    rescue => e
      puts "Error: #{e.message}"
      exit(1)
    end
  end
end
