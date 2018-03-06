OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '184244015521252', '0c2d04da92b3cf95ab6f9c5b7d1ee946'
end
