unified_mode true

# Cookbook:: keepalived
#
# Resource:: config
#

actions :add, :remove
default_action :add

attribute :user, kind_of: String, default: 'keepalived'
attribute :vrrp_secrets, kind_of: Hash, default: {}
attribute :virtual_ips, kind_of: Hash, default: {}
attribute :virtual_ips_per_ip, kind_of: Hash, default: {}
attribute :managers, kind_of: Array, default: []
attribute :balanced_services, kind_of: Array, default: []
attribute :has_any_virtual_ip, kind_of: [TrueClass, FalseClass], default: false
attribute :manager_services, kind_of: Hash, default: {}
attribute :ipmgt, kind_of: String, default: '127.0.0.1'
attribute :iface_management, kind_of: String, default: ''
attribute :iface_sync, kind_of: String, default: ''
attribute :ipaddress_sync, kind_of: String, default: '127.0.0.1'
attribute :managers_per_service, kind_of: Hash, default: {}
