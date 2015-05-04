#!/usr/bin/env ruby
require 'json'
#require 'pry'

module Git
  class Export
    def self.export(file_contents)
      
      config_settings = {}
      current_section = ""
      current_key = ""
      current_value = ""
      
      file_contents.each_line do |line|
        if section?(line)
          current_section = section_name_from(line)
        elsif key_value_pair?(line)
          current_key, current_value = key_and_value_from(line)
          config_settings[current_section + "." + current_key] = current_value
        end
      end
      
      config_settings = {"global"=>config_settings}
      JSON.pretty_generate(config_settings)
    end
    
    def self.section?(line)
      line.strip.match(/^\[([^\]]+)\]$/)
    end
    
    def self.section_name_from(line)
      m = line.strip.match(/^\[(([^\]"]+)( "([^"]+)")?)\]$/)
      output = m[2]
      output += "." if m[4]
      output += m[4].to_s
      return output
    end
    
    def self.key_value_pair?(line)
      line.strip.match(/^[^=]+ = [^=]+$/)
    end
    
    def self.key_and_value_from(line)
      m = line.strip.match(/^([^=]+) = ([^=]+)$/)
      return m[1], m[2]
    end
  end
end