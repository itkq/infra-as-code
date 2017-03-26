link '/etc/localtime' do
  to "/usr/share/zoneinfo/Azia/Tokyo"
  force true
  notifies :run, 'execute[dpkg-reconfigure tzdata]'
end

execute 'dpkg-reconfigure tzdata' do
  action :nothing
  command 'dpkg-reconfigure --frontend noninteractive tzdata'
end
