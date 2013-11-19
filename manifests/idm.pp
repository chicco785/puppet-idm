class idm (
     $domain          = $idm::params::domain,
     $services_name   = $idm::params::services_name,
     $services_title  = $idm::params::services_title,
     $help_enable     = $idm::params::help_enable,
	   $help_name       = $idm::params::help_name,
	   $help_title      = $idm::params::help_title,
     $subdomain       = $idm::params::subdomain,
     $sender          = $idm::params::sender,
     $name            = $idm::params::name,
     $logo            = $idm::params::logo,
     $bug_receivers   = $idm::params::bug_receivers,
     $allowed_email_domains= $idm::params::bug_receivers,
     $packages  = $idm::params::packages,
     $vhost_dir = $idm::params::vhost_dir
    ) inherits idm::params {
    
    class { 'rvm': version => '2.0.0' }
    rvm_system_ruby {
      'ruby-2.0.0-p247':
        ensure => 'present',
        default_use => true;
    }
    
    mysql::db { 'fi-ware-idm_development':
    user     => 'idm',
    password => 'idm',
    host     => 'localhost',
    # TODO does it make sense to support other charsets?
    charset  => 'utf8',
    require  => Class['mysql::server'],
    }
    
    vcsrepo { "/var/www/idm":
      #ensure => latest,
      provider => git,
      source => 'git://github.com/ging/fi-ware-idm.git',
      revision => 'master',
    }
    
    class { 'nginx': }
    
    nginx::resource::vhost { $domain:
      ensure   => present,
      www_root => '/var/www/idm',
    }
}