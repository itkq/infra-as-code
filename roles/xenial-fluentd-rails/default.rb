node.reverse_merge!(
  release: 'xenial'
)

include_cookbook 'base'
include_cookbook 'build-essential'
include_cookbook 'td-agent'
include_cookbook 'ruby'
include_cookbook 'rails'
