class idm::params {
  # The domain this IdM in installed at
  $domain = 'account.lab.fi-ware.eu'

  # The servives available in the portal
  #
  # service level domain
  $services_name = ['cloud','store','mashup']
  #
  # title for the nav bar
  $services_title =  ['Cloud','Store','Mashup']
  #
  # enable or disable help page link 
  $help_enable = true
  #
  # define serivce level domain for help
  $help_name = ''
  #
  # define title for the help in the navigation bar
  $help_title = 'Help&info'
  #
  
  # The subdomain of the portal: cloud, store, mashup
  #
  $subdomain = 'lab.fi-ware.eu'

  # The sender of registration emails
  #
  $sender    = 'no-reply@account.lab.fi-ware.eu'

  # The name of the IdM
  $name      = "FI-Lab"

  # The logo of the IdM
  #
  $logo      = "FI-Lab.png"

  # Email address that will receive bug reports
  #
  $bug_receivers = [ 'admin@lab.fi-ware.eu' ]

  # List of email domains that are allowed to register
  $allowed_email_domains = undef

  $packages = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => 'apache2',
    /(?i-mx:centos|fedora|redhat)/ => 'httpd',
    default => 'apache2'
  }
  
  $vhost_dir = $operatingsystem ? {
    /(?i-mx:ubuntu|debian)/        => '/etc/apache2/sites-enabled',
    /(?i-mx:centos|fedora|redhat)/ => '/etc/httpd/conf.d',
    default => '/etc/apache2/sites-enabled'
  }
}