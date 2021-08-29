module ErrorRescuable
  extend ActiveSupport::Concern

  included do
    # rescue_from ApplicationError, with: :handle_api_error

    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    rescue_from ActiveRecord::InvalidForeignKey, with: :handle_invalid_foreign_key

    rescue_from ActionController::UnknownFormat, with: :handle_api_error
    rescue_from ActionController::ParameterMissing, with: :handle_params_error

    rescue_from Pundit::NotAuthorizedError, with: :handle_not_authorized
  end

  def handle_api_error(error)
    render json: error.to_json, status: error.status
  end

  def handle_record_invalid(error)
    handle_api_error(ApplicationError.new(error.message, :unprocessable_entity, error.record.errors))
  end

  def handle_record_not_found(error)
    handle_api_error(ApplicationError.new(error.message, :not_found))
  end

  def handle_invalid_foreign_key(_error)
    handle_api_error(ApplicationError.new('Foreign key violation', :bad_request))
  end

  def handle_params_error(error)
    handle_api_error(ApplicationError.new("Parameter #{error.param} is missing", :bad_request))
  end

  def handle_not_authorized(_error)
    handle_api_error(ApplicationError.new('You are not allowed to access this resource!', :forbidden))
  end
end
