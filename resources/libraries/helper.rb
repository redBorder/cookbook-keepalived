module Keepalived
  module Helper
    def get_postgresql_master(virtual_ip, iface)
      # Fetch IPs on the interface
      ips_on_interface = `ip addr show dev #{iface}`.lines
                                                    .select { |line| line.match?(/\binet\b/) }
                                                    .map { |line| line.split[1].split('/').first }

      return 'current-master' unless ips_on_interface.include?(virtual_ip)

      # Fetch sync IP
      sync_ip = ips_on_interface.first

      # Fetch master name from serf members
      serf_members = `serf members`.lines.select { |line| line.include?('alive') }
      master_node = serf_members.find { |member| !member.include?(sync_ip) }
      master_node&.split&.first
    end
  end
end
