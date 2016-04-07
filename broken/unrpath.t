use strict;
use warnings;

use Devel::CheckLib qw(assert_lib);

my $set_rpath = shift;

my $path = "/usr/local/libssh2";
my $incpath = "$path/include";
my $libpath = "$path/lib";
my @rpath = ($set_rpath ? (ldflags => "-Wl,-rpath=$libpath") : ());

assert_lib(debug => 1,
           header => 'libssh2.h',
           lib => 'ssh2',
           incpath => $incpath,
           libpath => $libpath,
           @rpath,
           function => <<EOF);

libssh2_init(0);
return 0;

EOF
