class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix

  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if resource.persisted?
      # Generate token using Devise and JWT
      token = request.env['warden-jwt_auth.token']

      render json: {
        status: {code: 200, message: 'Signed up successfully.'},
        data: {
          current_user: current_user,
          token: token  # Include the token in the response body
        }
      }
    else
      render json: {
        status: {message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end
end
