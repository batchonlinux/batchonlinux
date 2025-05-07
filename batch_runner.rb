require_relative 'wine_executor'

module BatchRunner
  def self.run(batch_file)
    begin
      # Ellenőrizzük, hogy létezik-e a fájl
      raise "Batch file '#{batch_file}' does not exist" unless File.exist?(batch_file)

      # Futtatjuk a batch fájlt
      WineExecutor.run(batch_file)
    rescue => e
      puts "Error: #{e.message}"
      exit(1)
    end
  end
end
