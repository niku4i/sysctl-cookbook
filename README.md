# sysctl-cookbook

### sysctl::default

Include `sysctl` in your node's `run_list` and set `node['sysctl']['params']`

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sysctl]"
  ]
  "attributes": {
    "sysctl": {
      "params": {
        "net.core.somaxconn": 256,
        "net.ipv4.udp_mem": [ 11111, 22222, 33333 ],
        "vm.numa_zonelist_order": "default",
        "net": {
          "ipv4": {
            "route": {
              "gc_thresh": 2468
            }
          }
        }
      }
    }
  }
}
```

Above will generate /etc/sysctl.conf with following contents

```
net.core.somaxconn=256
net.ipv4.route.gc_thresh=2468
net.ipv4.udp_mem=11111 22222 33333
vm.numa_zonelist_order=default
```

Or set attributes in your custom recipe:

```
node.default['sysctl']['params']['net.core.somaxconn'] = 256
node.default['sysctl']['params']['net.ipv4.udp_mem'] = %w(11111 22222 33333)
node.default['sysctl']['params']['vm.numa_zonelist_order'] = "default"
node.default['sysctl']['params']['net']['ipv4']['[route']['gc_thresh'] =  2468
```

# Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

# License and Authors

Authors: Nobuhiro Nikushi
