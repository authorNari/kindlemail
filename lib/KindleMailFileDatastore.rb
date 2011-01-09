require 'constants.rb'
class KindleMailFileDatastore
  
  def load_store
    if(File.exist?(FILE_STORE))
      data = IO.read(FILE_STORE)
      @db = Marshal.load(data)
    else
      @db = {}
    end
  end

  def file_exists?(kindle_addr, filename)
    load_store
    if(@db.key?kindle_addr == false)
      return false
    elsif(@db[kindle_addr].nil?)
      return false
    elsif(@db[kindle_addr].key?filename)
      puts "This file was sent to #{kindle_addr} on #{@db[kindle_addr][filename]}"
      return true
    end
    return false
  end
  
  def add_entry(kindle_addr,filename)
    load_store
    @db[kindle_addr] = {} if(@db[kindle_addr].nil?)
    @db[kindle_addr][filename] = Time.now
    data = Marshal.dump(@db)
    file = File.new(FILE_STORE, "w")
    file.write data
    file.close
  end

  def print_history
    load_store
    if !@db.empty?
      @db.each { |email, val| 
        puts email 
        val.each { |filename,sentdate|  print " => " + filename  + " was sent on " + sentdate.strftime("%a %d %h %H:%M:%S") + "\n" }
      }
    else
      puts "There are no items in the history"
    end
  end

  def clear_history
    FileUtils.rm(FILE_STORE) if File.exist?(FILE_STORE)
  end
end
