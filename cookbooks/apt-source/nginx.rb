execute 'apt-get update' do
  subscribes :run, 'template[/etc/apt/sources.list.d/nginx.list]'
  action :nothing
end

template "/etc/apt/sources.list.d/nginx.list" do
  owner 'root'
  group 'root'
  mode '644'
  not_if 'grep -h ^deb /etc/apt/sources.list /etc/apt/sources.list.d/* | grep -q nginx'
end
