class VacanciesController < ApplicationController
  def create
    message_params = params[:vacancy_request] || {}
    message = VacancyRequest.create!(message_params)
    ApplicationMailer.new_vacancy_request(message).deliver

    data = {}
    render json: data, status: 201
  end
end