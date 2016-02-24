class nginx {

case $operatingsystem {
  'RedHat', 'CentOS': { include nginx::redhat  } # apply the redhat vars
  /^(Debian|Ubuntu)$/:{ include nginx::debian  } # apply the debian vars
  'Windows':          { include nginx::windows  } # apply the windows vars
  default:            { fail("cannot process ERB variables for ${operatingsystem}")  } #fail otherwise
}

package { 'nginx':
  ensure => present,
}

File{
 owner => '0',
 group => '0',
 mode => '0644'
}

file { '/var/www' :
ensure => directory
}

file { '/etc/nginx/nginx.conf':
  ensure  => file,
  #source  => 'puppet:///modules/nginx/nginx.conf',
  content => template('nginx/nginx.conf.erb'),
  require => Package['nginx'],
}

file { '/etc/nginx/conf.d/default.conf': 
  ensure  => file,
  #source  => 'puppet:///modules/nginx/default.conf',
  content => template('nginx/default.conf.erb'),
  require => Package['nginx'],
}


file { '/var/www/index.html': 
  ensure  => file,
  source  => 'puppet:///modules/nginx/index.html',
  require => Package['nginx'],
}
}
