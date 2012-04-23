# Class: fw
class fw (
    $packages = $fw::params::packages,
) inherits fw::params {
    anchor { 'fw::start': } ->
    class { 'fw::file': } ->
    class { 'fw::install': } ~>
    anchor { 'fw::end': }
}
