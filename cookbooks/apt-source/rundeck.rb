execute 'apt-get update' do
  subscribes :run, 'execute[Configure the Rundeck apt repository]'
  action :nothing
end

execute 'Configure the Rundeck apt repository' do
  command <<-EOH
echo 'deb https://dl.bintray.com/rundeck/rundeck-deb /' \
  | sudo tee /etc/apt/sources.list.d/rundeck.list
EOH
  not_if 'grep -h ^deb /etc/apt/sources.list /etc/apt/sources.list.d/* | grep -q rundeck'
end
