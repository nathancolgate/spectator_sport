class ExamplesController < ApplicationController
  def index
  end

  def new
    @resource = FakeModel.new
  end

  def create
    resource_params = params.require(:resource).permit(:name, :message)
    @resource = FakeModel.new(resource_params)
  end

  class FakeModel
    include ActiveModel::Model
    attr_accessor :name, :message

    def self.model_name
      ActiveModel::Name.new(self, nil, "Resource")
    end
  end
end
