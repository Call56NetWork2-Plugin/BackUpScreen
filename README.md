# BackUpScreen
## 事前準備
サーバーのプロセスをscreen環境で動かしていた方が何かと都合がいいのでscreenが入っていない場合はインストールをします。
```
yum -y install screen
```
rootユーザかsudoで実行してください。

## 次にバックアップデータを保存しておくディレクトリを作ります。
場所及びディレクトリ名は自由です。(Minecraftサーバのworldディレクトリ内だけ避けてください)
```
$ mkdir backup
```
## シェルスクリプト
今回のメインとなるプログラムです。
まずは自分の好きな場所にシェルを作りましょう。
以下マイクラサーバと同じユーザで行ってください。

viエディタの使い方
```
$ vi backup.sh
```

### 引用:
https://qiita.com/T1kus0n/items/7dcc6b28d84ff3365e6c
