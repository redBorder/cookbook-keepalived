%global cookbook_path /var/chef/cookbooks/keepalived

Name: cookbook-keepalived
Version: %{__version}
Release: %{__release}%{?dist}
BuildArch: noarch
Summary: redborder keepalived cookbook to configure keepalived service in redborder environments

License: AGPL 3.0
URL: https://github.com/redBorder/cookbook-keepalived
Source0: %{name}-%{version}.tar.gz

%global __brp_mangle_shebangs %{nil}

%description
%{summary}

%prep
%setup -qn %{name}-%{version}

%build

%install
mkdir -p %{buildroot}%{cookbook_path}
cp -f -r  resources/* %{buildroot}%{cookbook_path}
chmod -R 0755 %{buildroot}%{cookbook_path}
install -D -m 0644 README.md %{buildroot}%{cookbook_path}/README.md

%pre

%post
case "$1" in
  1)
    # This is an initial install.
    :
  ;;
  2)
    # This is an upgrade.
    su - -s /bin/bash -c 'source /etc/profile && rvm gemset use default && env knife cookbook upload keepalived'
  ;;
esac

%files
%defattr(0755,root,root)
%{cookbook_path}
%defattr(0644,root,root)
%{cookbook_path}/README.md

%doc

%changelog
* Thu May 28 2024 David Vanhoucke <dvanhoucke@redborder.com> - 0.0.1
 first spec version
