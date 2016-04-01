OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
end