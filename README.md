# Misoni

[![Gem Version](https://badge.fury.io/rb/misoni.svg)](http://badge.fury.io/rb/misoni)

Magical login to the Zokei Network.

「ZOKEIネットワーク接続のための認証が必要です」を二度と見ないことを目的としたプロジェクトです。鯖の味噌煮。


## Installation

```
$ gem install misoni
```


## Configuration

### WiFiの接続が変わったときに自動的にスクリプトが起動するようにします

```
$ misoni install
```

途中、 `sudo` パスワードが求められます。


### 認証のためのIDとパスワードを設定します

```
$ misoni config
```

もしくは `pit` コマンドを直接

```
$ pit set "http://auth.zokei.ac.jp:16978"
```

するとエディタが開くので、

```
---
id: a学籍番号
password: パスワード(デフォルトだと生年月日のやつ)
```

のように編集してください。



## Usage

```
$ misoni auth
```

すると設定したアカウントで認証します。

上記 `install` をしている場合、手動で実行する必要はないです。


## Kanpa

http://www.amazon.co.jp/registry/wishlist/23CDAA2HM4C5B

## License

The MIT License (MIT)

Copyright (c) 2015 neo

Portions are:  
Copyright (c) 2012 MATSUOKA Kohei  
MIT License  
https://github.com/machu/wifi_login
