node.reverse_merge!({
  ruby: {
    version: '2.3'
  }
})

ruby_release = node[:ruby][:version].match(/\d+\.\d+/)[0]

package "libruby#{ruby_release}" do
  action :install
  options '--force-yes'
end

package "ruby#{ruby_release}" do
  action :install
  options '--force-yes'
end

package "ruby#{ruby_release}-dev" do
  action :install
  options '--force-yes'
end

remote_file '/etc/gemrc' do
  owner 'root'
  group 'root'
  mode '0644'
end
