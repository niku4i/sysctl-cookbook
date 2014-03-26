require 'spec_helper'

describe file('/etc/sysctl.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain "net.core.somaxconn=256" }
  it { should contain "net.ipv4.udp_mem=11111 22222 33333" }
  it { should contain "vm.numa_zonelist_order=default" }
  it { should contain "net.ipv4.route.gc_thresh=2468" }
end

describe command("sysctl -a") do
  its(:stdout) { should match /^net\.core\.somaxconn = 256$/ }
  its(:stdout) { should match /^net\.ipv4\.udp_mem = 11111\s+22222\s+33333$/ }
  its(:stdout) { should match /^vm\.numa_zonelist_order = default$/ }
  its(:stdout) { should match /^net\.ipv4\.route\.gc_thresh = 2468$/ }
end
