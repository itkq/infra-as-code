include_cookbook 'locale'

package 'python-pip' do
  action :install
  options '--force-yes'
end
