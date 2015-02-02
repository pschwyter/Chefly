Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['511590885645406'], ENV['6b67626b0a25d764b55159ee127be511'],
  				 :scope => 'public_profile', :display => 'popup'
end