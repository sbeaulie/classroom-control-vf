class nginx {
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
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  source  => 'puppet:///modules/nginx/nginx.conf',
  require => Package['nginx'],
}

file { '/etc/nginx/conf.d/default.conf': 
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  source  => 'puppet:///modules/nginx/default.conf',
  require => Package['nginx'],
}


file { '/var/www/index.html': 
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  source  => 'puppet:///modules/nginx/index.html',
  require => Package['nginx'],
}
}
