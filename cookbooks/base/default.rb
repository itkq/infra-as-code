execute 'apt-get update'

%w[software-properties-common python-software-properties].each do |pkg|
  package pkg
end
