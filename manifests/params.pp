# Private class: See README.md.
class globus::params {

  case $::osfamily {
    'RedHat': {
      if $::operatingsystem == 'Fedora' {
        $repo_descr   = 'Globus-Toolkit-6-fedora'
        $repo_baseurl = "http://toolkit.globus.org/ftppub/gt6/stable/rpm/fedora/\$releasever/\$basearch/"
        $yum_priorities_package = 'yum-plugin-priorities'
      } else {
        $repo_descr   = "Globus-Toolkit-6-el${::operatingsystemmajrelease}"
        $repo_baseurl = "http://toolkit.globus.org/ftppub/gt6/stable/rpm/el/\$releasever/\$basearch/"

        if versioncmp($::operatingsystemmajrelease, '5') == 0 {
          $yum_priorities_package = 'yum-priorities'
        } elsif versioncmp($::operatingsystemmajrelease, '6') >= 0 {
          $yum_priorities_package = 'yum-plugin-priorities'
        } else {
          fail("Unsupported operatingsystemmajrelease: ${::operatingsystemmajrelease} for ${::operatingsystem}, only support 5, 6 and 7.")
        }
      }

      $release_url = 'http://toolkit.globus.org/ftppub/globus-connect-server/globus-connect-server-repo-latest.noarch.rpm'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}