node.reverse_merge!({
  rails: {
    version: '4.2.8',
  }
})

include_cookbook 'zlib1g::dev'
include_cookbook 'libxml2::dev'

execute "Install nokogiri" do
  command "gem install nokogiri -- use-sytem-libraries"
  not_if 'gem list | grep -q nokogiri'
end

execute 'Install rails' do
  command "gem install rails -v #{node[:rails][:version]}"
  not_if 'gem list | grep -q rails'
end
