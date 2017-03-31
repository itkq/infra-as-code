node.reverse_merge!(
  td_agent: {
    version: '2.3.4-0',
    auto_start: true,
  }
)

execute 'Download GPG key of treasure data' do
  command 'curl -sL https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -'
end

template "/etc/apt/sources.list.d/treasure-data.list" do
  notifies :nothing, 'execute[apt-get update]'
  owner 'root'
  group 'root'
  mode '644'
end

execute 'apt-get update'

package 'td-agent' do
  version node[:td_agent][:version]
  action :install
  options '--force-yes'
end

service 'td-agent' do
  if node[:td_agent][:auto_start]
    action [:enable, :start]
  else
    action [:disable]
  end
end
