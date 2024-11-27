module Keepalived
  module Helper
    def get_master(virtual_ip, iface, managers)
      sorted_managers = managers.map.with_index do |manager, index|
        priority = 50 + managers.size - index
        {
          name: manager.name,
          priority: priority,
        }
      end

      top_nodes = sorted_managers.first(2).sort_by { |node| -node[:priority] }

      if iface_has_virtual_ip?(iface, virtual_ip)
        top_nodes.second[:name]
      else
        top_nodes.first[:name]
      end
    end

    private

    def iface_has_virtual_ip?(iface, virtual_ip)
      iface_data = `ip addr show #{iface}`
      iface_data.include?(virtual_ip)
    end
  end
end
