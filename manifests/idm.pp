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
      
      
    }