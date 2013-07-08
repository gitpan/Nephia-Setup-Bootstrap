use strict;
use warnings;
use Nephia::Setup;
use Test::More;
use Capture::Tiny 'capture';
use Cwd;
use File::Temp 'tempdir';
use Guard;
use Plack::Test;

my $pwd = getcwd;

my $dir = tempdir(CLEANUP => 1);
chdir $dir;

my $guard = guard { chdir $pwd };

my $setup = Nephia::Setup->new(
    appname => 'Verdure::Memory',
    flavor  => ['Bootstrap'],
);

isa_ok $setup, 'Nephia::Setup::Base';
can_ok $setup, 'create';

subtest create => sub {
    my($out, $err, @res) = capture {
        $setup->create;
    };

    is $err, '', 'setup error';
    my $expect = join('',(<DATA>));
    if ($^O eq 'MSWin32') {
        $expect =~ s/\//\\/g;
    }
    like $out, qr/$expect/, 'setup step';
};

undef($guard);

done_testing;
__DATA__
create path Verdure-Memory/root/static/bootstrap
create path Verdure-Memory/root/static/bootstrap/css
create path Verdure-Memory/root/static/bootstrap/js
create path Verdure-Memory/root/static/bootstrap/img
create path Verdure-Memory/root/static/js
spew into file Verdure-Memory/root/static/bootstrap/css/bootstrap-responsive.css
spew into file Verdure-Memory/root/static/bootstrap/css/bootstrap-responsive.min.css
spew into file Verdure-Memory/root/static/bootstrap/css/bootstrap.css
spew into file Verdure-Memory/root/static/bootstrap/css/bootstrap.min.css
spew into file Verdure-Memory/root/static/bootstrap/img/glyphicons-halflings-white.png
spew into file Verdure-Memory/root/static/bootstrap/img/glyphicons-halflings.png
spew into file Verdure-Memory/root/static/bootstrap/js/bootstrap.js
spew into file Verdure-Memory/root/static/bootstrap/js/bootstrap.min.js
spew into file Verdure-Memory/root/static/js/jquery.js
