# http://www.linuxcommand.org/man_pages/logrotate8.html
node.reverse_merge!(
  logrotate: {
    interval: 'daily',   # daily, weekly, etc.
    rotate: 7,           # number of archives
    compress: true,      # compress old log
    delaycompress: true, # compress log after next cycle
    missingok: true,     # no errors output when missing log
    notifempty: true,    # do not rotate if empty
    copytruncate: true,  # copy original log and truncate it
  }
)

template '/etc/logrotate.d/some_service' do
  owner 'root'
  group 'root'
  mode '0644'
end
