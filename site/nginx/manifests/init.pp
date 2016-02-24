class nginx inherits nginx::params{

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
