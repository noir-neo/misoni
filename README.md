# Misoni

Magical login to the Zokei Network.

「ZOKEIネットワーク接続のための認証が必要です」を二度と見ないことを目的としたプロジェクトです。鯖の味噌煮。


## Installation

```
$ git clone https://github.com/noir-neo/misoni
$ cd misoni
$ bundle install --path vendor/bundle
```

あとでちゃんと`gem install`でできるようにします。


## Configuration

```
$ bundle exec bin/misoni config
```

をするとエディタが開くので

```
id: a学籍番号
password: パスワード(デフォルトだと生年月日のやつ)
```

のように編集してください。


## Usage

```
$ bundle exec bin/misoni auth
```

とかするといい感じです。  
`install`コマンドとかで、無線LANへの接続を検知してlaunchdで叩く設定まで勝手にやってくれるようにそのうちします。


## Kanpa

http://www.amazon.co.jp/registry/wishlist/23CDAA2HM4C5B

## License

The MIT License (MIT)

Copyright (c) 2015 neo
