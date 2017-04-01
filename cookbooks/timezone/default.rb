node.reverse_merge!(
  timezone: 'Asia/Tokyo'
)

link '/etc/localtime' do
  to "/usr/share/zoneinfo/#{node[:ubuntu_timezone]}"
  force true
  notifies :run, 'execute[dpkg-reconfigure tzdata]'
end

execute 'dpkg-reconfigure tzdata' do
  action :nothing
  command 'dpkg-reconfigure --frontend noninteractive tzdata'
end
