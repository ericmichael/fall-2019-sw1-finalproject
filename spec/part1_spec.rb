# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe User do
    it { should have_property           :id }
    it { should have_property           :email }
    it { should have_property           :password }
    it { should have_property           :role_id }
    it { should have_property           :created_at }
end

# add yours below