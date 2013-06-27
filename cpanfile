requires 'perl',   '5.010001';
requires 'Nephia';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
    requires 'Cwd';
    requires 'File::Temp';
    requires 'Guard';
    requires 'Plack::Test';
};
