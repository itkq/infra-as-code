node.reverse_merge!(
  newrelic: {
    auto_start: true,
    # license_key:
  }
)

unless node[:newrelic][:license_key]
  raise "node[:newrelic][:license_key] must be set"
end
# for ubuntu and debian
execute 'Configure the New Relic apt repository' do
  command <<-EOH
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' \
  | sudo tee /etc/apt/sources.list.d/newrelic.list
EOH
end

execute 'Trust the New Relic GPG key' do
  command <<-EOH
curl -sL https://download.newrelic.com/548C16BF.gpg \
  | apt-key add -
EOH
end

execute 'apt-get update'

package 'newrelic-sysmond' do
  action :install
  options '--force-yes'
end

execute 'Configure your New Relic license key' do
  command "nrsysmond-config --set license_key=#{node[:newrelic][:license_key]}"
end

service 'newrelic-sysmond' do
  if node[:newrelic][:auto_start]
    action [:enable, :start]
  else
    action [:disable]
  end
end
