# Misoni

[![Gem Version](https://badge.fury.io/rb/misoni.svg)](http://badge.fury.io/rb/misoni)

Magical login to the Zokei Network.

「ZOKEIネットワーク接続のための認証が必要です」を二度と見ないことを目的としたプロジェクトです。鯖の味噌煮。


## Installation

```
$ gem install misoni
```


## Configuration

```
$ misoni config
```

もしくは pit コマンドを直接

```
$ pit set "http://auth.zokei.ac.jp:16978"
```

するとエディタが開くので

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

`install`コマンドとかで、無線LANへの接続を検知してlaunchdで叩く設定まで勝手にやってくれるようにそのうちします。


## Kanpa

http://www.amazon.co.jp/registry/wishlist/23CDAA2HM4C5B

## License

The MIT License (MIT)

Copyright (c) 2015 neo
