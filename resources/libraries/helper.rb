module Keepalived
  module Helper
    def find_managers
      nodes = search(:node, 'roles:manager')
      manager_hash = {}
      nodes.each do |n|
        m_name = n['name']
        ip_sync = n['ipaddress_sync']
        ipaddress = n['ipaddress']
        manager_hash[m_name] = { ipaddress_sync: ip_sync, ipaddress: ipaddress }
      end
      manager_hash.to_json
    end
  end
end
