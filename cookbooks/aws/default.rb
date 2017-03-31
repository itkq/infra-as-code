node.reverse_merge!({
  aws: {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:            ENV['AWS_REGION'] || 'ap-northeast-1'
  }
})

include_cookbook 'python-pip'
include_cookbook 'jq'

directory '/root/.aws' do
  user 'root'
  mode '0755'
end

template '/root/.aws/config' do
  user 'root'
  mode '0600'
end

execute 'Install awscli' do
  command 'pip install awscli --upgrade --user'
end


