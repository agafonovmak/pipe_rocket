module PipedriveJetrockets
  class Stage < Entity
    def pipeline
      Pipedrive.pipelines.find(self.pipeline_id)
    end

    def display_name
      "#{pipeline.name}:#{name}"
    end
  end
end
