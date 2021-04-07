class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	rescue_from Exception, with: :render_500 unless Rails.env.development?
	rescue_from ActiveRecord::RecordNotFound, with: :render_404 #unless Rails.env.development?
	rescue_from ActionController::RoutingError, with: :render_404 #unless Rails.env.development?
	rescue_from ActionController::InvalidCrossOriginRequest, with: :invalid_cross_origin_request
	rescue_from ActionController::UnknownFormat, with: :render_unknown_format
	rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_authenticity_token


	before_action :configure_permitted_parameters, if: :devise_controller?

	def not_authorized(exception)
		loyalty_name = exception.loyalty.class.to_s.underscore
		logger.info "Banken 403 with exception: #{loyalty_name}.#{exception.query}"
		render file: Rails.root.join('public/403.html'), status: 403, layout: false, content_type: 'text/html'
		#render file: Rails.root.join('public/invalid_url.html'), status: 403, layout: false, content_type: 'text/html'
	end

	def invalid_authenticity_token(exception)
		logger.info "Invalid authenticity token with exception: #{exception.message}"
		render file: Rails.root.join('public/403.html'), status: 403, layout: false, content_type: 'text/html'
	end

	def invalid_cross_origin_request(exception)
		logger.info "Invalid cross origin request with exception: #{exception.message}"
	end

	def render_500(exception=nil)
		if exception && (![Wicked::Wizard::InvalidStepError].include? exception.class)
			notify_airbrake(exception)
			logger.fatal "Rendering 500 with exception: #{exception.message}"
		end
		render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
	end

	def render_404(exception=nil)
		if exception
			logger.info "Rendering 404 with exception: #{exception.message}"
		end
		render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
	end

	def render_unknown_format(exception=nil)
		if exception
			logger.info "UunknownFormat with exception: #{exception.message}"
		end
		render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
	end

	protected

	def configure_permitted_parameters
		added_attrs = [:last_name, :first_name, :email, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
end
