package Noraneko::Config;
use utf8;

sub neko {
    return {
        'site' => {
            'maintenance' => 1,   # 1にするとメンテモードに移行するとか?
            'copyright' => 'Copyright (C) 京都市役所ネコ課',
            'ja' => {
                'name' => 'ネコ管理システム',
            },
            'en' => {
                'name' => 'Stray Cats Administration System',
            },
        }
    };
}

sub auth {
    return {
        'database' => {
            'dbtype' => 'PostgreSQL',
            'dbname' => 'nekochan',
            'hostname' => '192.0.2.22',
            'port' => 5432,
            'username' => 'dbadmin',
            'passowrd' => 'nyanko',
        }
    };
}

1;
