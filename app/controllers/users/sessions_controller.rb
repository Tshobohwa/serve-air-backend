class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix

  respond_to :json

  private

  # Method for responding after a successful login
  def respond_with(current_user, _opts = {})
    # Retrieve the JWT token from Devise JWT after successful login
    token = request.env['warden-jwt_auth.token']

    render json: {
      status: {
        code: 200,
        message: 'Logged in successfully.',
        data: {
          user: UserSerializer.new(current_user).serializable_hash[:data][:attributes],  # Serialized user data
          token: token  # Include the JWT token in the response
        }
      }
    }, status: :ok
  end

  # Method for responding after logout
  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      # Decode the JWT token from the Authorization header to find the user
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
