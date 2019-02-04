module PipeRocket
  class File < Entity
    def initialize(hash)
      super(hash)
      @url = Pipedrive.files.file_url(self.id)
    end
  end
end
