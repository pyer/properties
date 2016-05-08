# encoding: UTF-8

module Pyer
  # This class represents the INI file and can be used to parse INI files.
  class Properties
    # Create a new configuration hash
    def initialize(filename, opts = {})
      @filename = filename
      @encoding = opts[:encoding]
      @comment  = opts[:comment]
      @mode = @encoding.nil? ? 'r' : "r:#{@encoding}"
      @settings = {}
      hashing if File.exist? @filename
    end

    # Return count of valid properties
    def count
      @settings.length
    end

    # Return value or nil if name is unknown
    def method_missing(name)
      @settings[name.to_sym]
    end

    private

    def hashing
      File.open(@filename, @mode).each_line do |line|
        next if line.length < 3
        next if line[0] == '#' || line[0] == ';' # known comments
        i = line.index('=')
        next if i < 1
        line.chop! if line[-1] == "\n"
        @settings.merge!(line[0, i].strip.to_sym => line[i + 1, line.length - 2].strip)
      end
    end
  end
end

# Shortcut
Properties = Pyer::Properties
