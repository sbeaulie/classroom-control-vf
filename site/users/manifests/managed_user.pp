define users::managed_user (
  $user = $title,
  $group = 'admin'
) {
  user { $user:
    ensure => present,
    managehome => false,
  }
  file { "/home/$user":
    ensure => directory,
    require => User[$user],
  }
}
