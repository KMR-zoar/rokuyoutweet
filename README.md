六曜をツイートします。  
金曜日だけファンキーをツイートするのでご注意ください。

[旧暦を取得する Web API](http://api.sekido.info/qreki?output=usage) から六曜を取得してツイートします。

`make.config.rb` はツイートをするための設定を作るスクリプトです。  
本体を実行する前に一度実行してください。

`rokuyoutweet.rb` が本体です。

```
bundle install --path vendor/bundle
ruby make.config.rb
ruby rokiyoutweet.rb
```

These scripts set is under the MIT license.
