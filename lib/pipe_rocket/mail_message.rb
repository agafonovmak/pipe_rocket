module PipeRocket
  class MailMessage < Entity
    attr_accessor :files
    def initialize(hash)
      super(hash)
      @files = hash['attachments'].map do |file|
        PipeRocket::File.new(file)
      end
    end
  end
end
