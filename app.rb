require "sinatra"
require "sinatra/namespace"
require_relative 'models.rb'
require_relative "api_authentication.rb"

#creating an admin account
#for you, if you have no accounts
if User.all.count == 0
	u = User.new
	u.email = "admin@admin.com"
	u.password = "admin"
	u.role_id = 0
	u.save
end

def api_admin_only!
	api_authenticate!
	halt 401, {message: "Admins only"}.to_json if !current_user.administrator?
end

namespace '/api' do
	before do
		content_type 'application/json'
	end

	get "/admin" do
		api_admin_only!
		halt 200, {message: "super secret admin stuff"}.to_json
	end

	get "/hello" do
		api_authenticate!
		halt 200, {message: "hello, #{current_user.email}"}.to_json
	end

end
