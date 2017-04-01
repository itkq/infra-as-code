node.reverse_merge!(
  rundeck: {
    version: '2.6.9',
  }
)

include_cookbook 'apt-source::rundeck'

package 'rundeck' do
  version node[:rundeck][:version]
  options '--force-yes'
end
