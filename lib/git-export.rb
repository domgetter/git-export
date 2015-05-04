#!/usr/bin/env ruby
require 'json'

module Git
  class Export
    def self.export(file_contents)
      file_contents.each_line do |line|
        if section?(line)
          current_section = section_name_from(line)
        elsif key_value_pair?(line)
          current_key, current_value = key_and_value_from(line)
        end
        
      end
    end
    
    def self.section?(line)
    
    end
    
    def self.section_name_from(line)
    
    end
    
    def self.key_value_pair?(line)
    
    end
    
    def self.key_and_value_from(line)
    
    end
  end
end