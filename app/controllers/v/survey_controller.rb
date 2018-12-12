# frozen_string_literal: true

class V::SurveyController < ApplicationController

  def create
    survey = Survey.new(survey_params)
    if survey.save
      render json: true, status: :created
    else
      render json: false, status: :bad
    end
  end

  private
  def survey_params
    params.require(:survey).permit(
      :title, questions_attributes: [:title, :q_type])
  end
end
