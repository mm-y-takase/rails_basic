Rails.application.config.generators do |generator|
	generator.helper false
	generator.assets false
	generator.skip_routes true
	generator.test_framework false
end