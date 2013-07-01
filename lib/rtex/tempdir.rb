
module RTeX
  
  class Tempdir #:nodoc:

    @@auto_delete = true

    def self.auto_delete=(val)
      @@auto_delete = val
    end
        
    def self.open(parent_path=RTeX::Document.options[:tempdir])
      tempdir = new(parent_path)
      FileUtils.mkdir_p tempdir.path
      result = Dir.chdir(tempdir.path) do
        yield tempdir
      end
      # We don't remove the temporary directory when exceptions occur,
      # so that the source of the exception can be dubbed (logfile kept)
      tempdir.remove! if @@auto_delete
      result
    end
    
    def initialize(parent_path, basename='rtex')
      @parent_path = parent_path
      @basename = basename
      @removed = false
    end
    
    def path
      @path ||= File.expand_path(File.join(@parent_path, 'rtex', "#{@basename}-#{uuid}"))
    end
    
    def remove!
      return false if @removed
      FileUtils.rm_rf path
      @removed = true
    end
    
    #######
    private
    #######
    
    def uuid
      "#{Time.now.to_i}-#{Thread.current.hash}-#{hash}"
    end
    
  end
  
end
