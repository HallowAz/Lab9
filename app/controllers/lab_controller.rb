# frozen_string_literal: true

# Controller for main logic
class LabController < ApplicationController
  include LabHelper

  def input; end

  def result
    @res = LabResult.new(lab_params)
  end

  private

  def lab_params
    params.permit(:numb)
  end
end
