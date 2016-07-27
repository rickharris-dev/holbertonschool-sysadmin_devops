#
# Cookbook Name:: holberton-wrapper
# Recipe:: default
#
# Copyright (C) 2016 Rick Harris
#
# All rights reserved - Do Not Redistribute
#

# Add the dotdeb repo
apt_repository 'dotdeb' do
  uri 'http://packages.dotdeb.org'
  components ['main']
end

# Configure Open SSH
node.default['openssh']['server']['permit_root_login'] = 'no'
node.default['openssh']['server']['password_authentication'] = 'no'

# Set user accounts
user_account 'holberton' do
  ssh_keys 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRgomCmh+LcBwZOgmQZw3SvLFDBD0LGZN6ZoZnP70JvXMeEFiF9CtazJZObh6+PSwVkwrH5t3jznJcpm+vLDlmfy51WyPMj+vtTSVRfAacdv3N4D0/NiDUwwESvIQQgwQparyA/xkcbApRqa9ym7Le+0GQqRXFz/nt/HFijzbBDwfVNsc2aurfwLClJdzDrm6BZO4QAtE7OaMM/1yMOri6MahsOgl71OZ5dgUmVCUvJUZvGTVMnhgyFsYQ/aI5T0qQgQZoA0ao+nwqbKEjlAUJ/G5TqoczOXqWznYtfiHcdFCcBKdU9JLMZFNaFueHlCwrw4uEpw9v3ISKXhCJenDqNQYCIDDa/3nkvSKiqAGm189vDQOr8jt3rSCFZ7ceIW3ot+BV6UBFoKaF4z7Ve3W1QH8cnvUlL10G4HewHxVmeT762sWoRZcVQNygslCveii6BP8mPoayt8Gg1SDoFZBc90EwmOl/xvd/QB3FBd9ZkwA1ddATBiCk4LF6V2mo/f8l5Tb6gdR/2Vl0BUJhHyha26zdKpFpJr5ygqtuimH2OIZ4+W78RKH/0+/7OkKPl4KBbpyfD8yf+VU/fsKDXfjC5E+5V4+4Iu1DWLUiTc4xv+6/dxSTG3i4VcJ6DrgEk+TYRnCgKn7XKI/6maPPvtv/+olCzX4zQ/ehGIqO8N1IDw=='
  comment 'Holberton School'
end

user_account 'rick' do
  ssh_keys 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5hsn/3vgN5aALc5KRHmKQ6DriypjBuFVD4D3GqIAX7GzCxANCuWr8GNOIQz2saIIlQjxUrVay4jnyS/1Fk4YqmXQe5oLYXjwMFRaZhwj9S4npNauEKrMh28H8C4dqKPnyqUK7Pd2BFuAvgM1g0el1jYvqAY5XlnGPZFDnoanSqgUPeO+eSuoUxlInAsgHA2HlYDlK4B7WBxqiRF5P0wYLGeHZKujb0miXNwGPa9v/EhBKrvciiTyUNnPC9fqeHeBiLG87I/7tqDNfZcqlm4s6yNeuBPlv2Ww1r+0/WPAr7XSORlR8GkTIWahmWEgy8mItpOwnS8EKGdLL//a7qYErj9R0RxvO9I5AKEXPk75XTNGc4Kv12NUaR/jEDtk0/3NSmstmvq95AE7xSPpUIX9F3pc12Xu/zrmWRH9PmipxAH9BOEDqTHQbn4Dbtgm97U4yuJtGdBWjVJUxTaEquMofE8ffFasmzeayRdzNc/0lqXDV1kordIfjzAX4FSB4GjaCMnURO6ms6Mvw85wQAxnw3UyPkjsfOEcAKG3q3bF2+qiDZxPuaI9PSIkjSezs0AO7Y2duy3jf+fyONBaQ8OO8rT0w2fm4s8CgMZFQwmjWBH4kKVmHT8wsI1l+ZkEUXWOsb90/c5iZ0x4yHoZRYsa0xxi+rImvWpk+MfXkXI3Scw== rickharris724@gmail.com'
  comment 'Rick'
end

#Install and configure nginx
package 'nginx'

service 'nginx' do
  action [:enable, :start]
end

# Change homepage to hello world template
file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end

# Install net-tools
package 'net-tools'

# Configure firewall
