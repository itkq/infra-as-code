node.reverse_merge!({
  nginx: {
    version: "1.11.9-0+#{node[:release]}0",
  }
})

include_cookbook 'apt-source::nginx'

package 'nginx-common' do
  action :install
  version node[:nginx][:version]
  options '--force-yes'
end

package 'nginx-full' do
  action :install
  version node[:nginx][:version]
  options '--force-yes'
end

package 'nginx' do
  action :install
  version node[:nginx][:version]
  options '--force-yes'
end

service 'nginx'
