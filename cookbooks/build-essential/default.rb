package 'build-essential' do
  case node[:release]
  when :xenial
    version '12.1ubuntu2'
  end

  action :install
end
