# Klapper LB

Klapper is a drop in replacement for the k3s loadbalancer [Klipper-LB](https://github.com/k3s-io/klipper-lb).    
Instead of using `iptables` and `ip6tables` to forward packages, it uses `socat` and just tunnels the traffic.  
It addresses the issue with proxy protocol v2 and other related problems that are usually caused by either NAT or missing interface bindings.   

## Usage

As it's intented to be simply used as a drop in replacement to `klipper-lb` (at least for now).

### Manual 

Replace the value in `spec.template.spec.image.containers[].image` where the `name` is `lb-tcp-80` and `lb-tcp-443` is in the `svclb-traeffik-*` Daemonset to `brainwaveoss/klapper-lb:v0.1.0` or point to the image in your own registry.

### Configuration

Default behavior is to check the ipv4 container IPs if they start with `10.*` and the ipv6 with `fd00:*`.  
This behavior can be overwritten by adding the environment variables `${IPV4_PREFIX}` for IPv4 and `${IPV6_PREFIX}` for IPv6 to match your configuration accordingly.  

## Notes

This is a a very simple implementation without much fuss.  
It might be interesting to investigate if it avoids the need for small deployments and replace `MetalLB` or use only one container for multiple Ports and Interfaces.  

## TODOs

- Add a manifest as replacement so loadbalancer none can be specified and replaced on the k3s command line for k3s server setup
- Add also a way to overwrite the deployment behavior
- Maybe make it a bit smarter and add some additional features like ipv6-to-ipv4, ipv4-to-ipv6, udp, etc.

## License

The Software is licensed under the MIT License. 