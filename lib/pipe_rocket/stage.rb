module PipeRocket
  class Stage < Entity
    # Return PipeRocket::Pipeline object which related with stage
    def pipeline
      Pipedrive.pipelines.find(self.pipeline_id)
    end

    # Returns stage name like PipelineName:StageName
    def display_name
      "#{pipeline.name}:#{name}"
    end
  end
end
