requires 'perl',   '5.010001';
requires 'Nephia', '0.19';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Capture::Tiny';
    requires 'Guard';
};

