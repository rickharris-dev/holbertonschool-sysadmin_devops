#
# Cookbook Name:: holberton-wrapper
# Recipe:: default
#
# Copyright (C) 2016 Rick Harris
#
# All rights reserved - Do Not Redistribute
#

# Add the dotdeb repo
include_recipe 'openssh'

apt_repository 'dotdeb' do
  uri 'http://packages.dotdeb.org'
  components ['main']
end

# Ensure OpenSSH directory exists
directory '/var/run/sshd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Recognize OpenSSH
begin
  r = resources(service: 'ssh')
  if 'debian' == node['platform']
    r.provider = Chef::Provider::Service::Debian
  end
end

# Set user accounts
user_account 'holberton' do
  ssh_keys 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRgomCmh+LcBwZOgmQZw3SvLFDBD0LGZN6ZoZnP70JvXMeEFiF9CtazJZObh6+PSwVkwrH5t3jznJcpm+vLDlmfy51WyPMj+vtTSVRfAacdv3N4D0/NiDUwwESvIQQgwQparyA/xkcbApRqa9ym7Le+0GQqRXFz/nt/HFijzbBDwfVNsc2aurfwLClJdzDrm6BZO4QAtE7OaMM/1yMOri6MahsOgl71OZ5dgUmVCUvJUZvGTVMnhgyFsYQ/aI5T0qQgQZoA0ao+nwqbKEjlAUJ/G5TqoczOXqWznYtfiHcdFCcBKdU9JLMZFNaFueHlCwrw4uEpw9v3ISKXhCJenDqNQYCIDDa/3nkvSKiqAGm189vDQOr8jt3rSCFZ7ceIW3ot+BV6UBFoKaF4z7Ve3W1QH8cnvUlL10G4HewHxVmeT762sWoRZcVQNygslCveii6BP8mPoayt8Gg1SDoFZBc90EwmOl/xvd/QB3FBd9ZkwA1ddATBiCk4LF6V2mo/f8l5Tb6gdR/2Vl0BUJhHyha26zdKpFpJr5ygqtuimH2OIZ4+W78RKH/0+/7OkKPl4KBbpyfD8yf+VU/fsKDXfjC5E+5V4+4Iu1DWLUiTc4xv+6/dxSTG3i4VcJ6DrgEk+TYRnCgKn7XKI/6maPPvtv/+olCzX4zQ/ehGIqO8N1IDw=='
  comment 'Holberton School'
end

#Install and configure nginx
package 'nginx'

service 'nginx' do
  action [:enable, :start]
  provider Chef::Provider::Service::Debian
end

# Install net-tools
package 'net-tools'
