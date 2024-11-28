module Keepalived
  module Helper
    require 'socket'

    def interface_for_ip(ip_address)
      return nil if ip_address.nil? || ip_address.empty?
      interfaces = Socket.getifaddrs
      interface = interfaces.find do |ifaddr|
        ifaddr.addr.ipv4? && ifaddr.addr.ip_address == ip_address
      end
      interface.name
    end
  end
end
