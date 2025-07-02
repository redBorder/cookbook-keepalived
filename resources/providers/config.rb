# Cookbook:: keepalived
#
# Provider:: config
#

include Keepalived::Helper

action :add do
  begin
    user = new_resource.user
    vrrp_secrets = new_resource.vrrp_secrets
    virtual_ips = new_resource.virtual_ips
    virtual_ips_per_ip = new_resource.virtual_ips_per_ip
    managers = new_resource.managers
    balanced_services = new_resource.balanced_services
    has_any_virtual_ip = new_resource.has_any_virtual_ip
    manager_services = new_resource.manager_services
    ipmgt = new_resource.ipmgt
    iface = new_resource.iface_management
    ipaddress_sync = new_resource.ipaddress_sync
    managers_per_service = new_resource.managers_per_service

    dnf_package 'keepalived' do
      action :upgrade
    end

    execute 'create_user' do
      command "/usr/sbin/useradd -r #{user} -s /sbin/nologin"
      ignore_failure true
      not_if "getent passwd #{user}"
    end

    service 'keepalived' do
      service_name 'keepalived'
      ignore_failure true
      supports status: true, reload: true, restart: true, enable: true
      action [:start, :enable]
    end

    template '/etc/sysconfig/keepalived' do
      cookbook 'keepalived'
      source 'keepalived.erb'
      owner 'root'
      group 'root'
      mode '0644'
      retries 2
      notifies :reload, 'service[keepalived]', :delayed
    end

    unless virtual_ips['external']['nginx']['ip'].nil?
      template '/usr/lib/redborder/bin/rb_keepalived_master_notify_webui.sh' do
        cookbook 'keepalived'
        source 'notify.erb'
        owner 'root'
        group 'root'
        mode '0755'
        retries 2
        variables(vip: virtual_ips['external']['nginx']['ip'])
      end

      template '/usr/lib/redborder/bin/rb_keepalived_backup_notify_webui.sh' do
        cookbook 'keepalived'
        source 'notify.erb'
        owner 'root'
        group 'root'
        mode '0755'
        retries 2
        variables(vip: virtual_ips['external']['webui']['ip'])
      end
    end

    unless virtual_ips['external']['sfacctd']['ip'].nil?
      template '/usr/lib/redborder/bin/rb_keepalived_master_notify_sfacctd.sh' do
        cookbook 'keepalived'
        source 'notify.erb'
        owner 'root'
        group 'root'
        mode '0755'
        retries 2
        variables(vip: virtual_ips['external']['sfacctd']['ip'])
      end

      template '/usr/lib/redborder/bin/rb_keepalived_backup_notify_sfacctd.sh' do
        cookbook 'keepalived'
        source 'notify.erb'
        owner 'root'
        group 'root'
        mode '0755'
        retries 2
        variables(vip: virtual_ips['external']['sfacctd']['ip'])
      end
    end

    template '/etc/keepalived/keepalived.conf' do
      cookbook 'keepalived'
      source 'keepalived.conf.erb'
      owner 'root'
      group 'root'
      mode '0644'
      retries 2
      notifies :reload, 'service[keepalived]'
      variables(
        vrrp_password: vrrp_secrets['pass'],
        managers: managers,
        start_id: vrrp_secrets['start_id'],
        balanced_services: balanced_services,
        virtual_ips: virtual_ips,
        virtual_ips_per_ip: virtual_ips_per_ip,
        has_any_virtual_ip: has_any_virtual_ip,
        manager_services: manager_services,
        ipmgt: ipmgt,
        iface: iface,
        ipsync: ipaddress_sync,
        managers_per_service: managers_per_service,
        sync_iface_name: interface_for_ip(ipaddress_sync)
      )
    end

    ips_added = {}
    node['redborder']['manager']['balanced'].each_with_index do |balance, iface_index|
      if !virtual_ips['external'][balance['service']].nil? && manager_services[balance['service']] && virtual_ips['external'][balance['service']]['ip'] != virtual_ips['external'][balance['service']]['physical_ip'] && !virtual_ips['external'][balance['service']]['ip'].nil? && ips_added[virtual_ips['external'][balance['service']]['ip']].nil? && virtual_ips['external'][balance['service']]['enable']
        ips_added[virtual_ips['external'][balance['service']]['ip']] = balance['service']
        template "/etc/sysconfig/network-scripts/ifcfg-lo\:#{iface_index}" do
          retries 2
          source 'ifcfg-lo.erb'
          owner 'root'
          group 'root'
          mode '0644'
          retries 2
          cookbook 'keepalived'
          variables(index: iface_index, ip: virtual_ips['external'][balance['service']]['ip'])
          notifies :run, 'execute[rb_create_lo.sh]', :delayed
        end
      elsif ::File.exist?("/etc/sysconfig/network-scripts/ifcfg-lo\:#{iface_index}")
        file "/etc/sysconfig/network-scripts/ifcfg-lo:#{iface_index}" do
          action :delete
          notifies :run, 'execute[rb_create_lo.sh]', :delayed
        end
      end
    end

    execute 'rb_create_lo.sh' do
      command '/usr/lib/redborder/bin/rb_create_lo.sh'
      action :nothing
    end
    Chef::Log.info('keepalived cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end

action :remove do
  begin

    service 'keepalived' do
      supports stop: true
      action :stop
    end

    Chef::Log.info('keepalived cookbook has been processed')
  rescue => e
    Chef::Log.error(e.message)
  end
end
