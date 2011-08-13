## Twitvoice
OS X Lionからsayコマンドの声に日本語を話す"Kyoko"が追加されました。
このスクリプトはsayを使ってTwitterの新着Tweetを読み上げます。

### Installation
    git clone git://github.com/y310/twitvoice.git
    cd twitvoice
    bundle install
    cp config.yml.sample config.yml

### Configuration
config.ymlを開いてconsumer key, consumer secret, oauth\_token, oauth\_token\_secretを設定してください。

こちらのページで取得方法が分かりやすく解説されています。

[Ruby Twitter Gem簡易リファレンス](http://route477.net/w/?RubyTwitterJa#l3)

### Run
    ruby twitvoice.rb
