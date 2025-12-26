# beamer-example
"beamer-example" は、自分の環境をなるだけ汚したくない方にも、beamerをお使いいただくための環境例です  
docker上にソースを転送したうえでコンパイルすることで、母艦の環境を汚しません

## Requirement
現時点では、本ソースを動かすコンピュータ環境はUbuntuを想定しています。  
（将来的には、Windows上のWSLや他OSでも動作可能にする予定)  
また、本ソースコードをダウンロードするためにgitのインストールをお願いします。
dockerのインストールもお願いします。  

## Installation
適当な作業ディレクトリを作成し、本ソースをcloneしてください。
sumoduleを使っているので“--recursive"を忘れずにつけてください

```
$ git clone --recursive https://github.com/ichmy55/beamer-example.git
```

## Directory tree
上記展開すると以下のようなディレクトリ構成になります
<pre>
.
├── README.md.................本リポジトリの説明書です．
├── Makefile..................Texコンパイル方法を記載したレシピファイル(※下記src/commons1に実体があります)
├── Dockerfile................Texコンパイル用のDockerイメージのレシピ(※下記src/commons1に実体があります)
├── .github
│   ├── script................reviewdog用スクリプト
│   └── workflow..............GitHubでのCI/CO設定ファイル.
├── src 
│   ├── commons1..............他のプロジェクトでも共通で使うファイルを切り出しています
│   └── beamer-example........Texソースをこのディレクトリに入れます.
│         └── images .........Texから読み込む画像ファイルを入れます.
│    
├── dist......................このディレクトリに結果pdfが生成されます.Make時に生成されます.
├── work......................ワーク用です.Make時に生成されます.
└── ltcache...................Latexのフォントキャッシュ用です.コンテナUp時に生成されます.(ローカル環境時)
                              ※ コンテナ内部では texlive標準の~/.texlive2023 以下にキャッシュが置かれます
</pre>
## Usage
make 一発で、docker環境の生成、docker環境へのソース転送、結果pdf生成し、同ファイルをdocker環境から引き出すところまで自動でやります  
結果ファイルが「dist」ディレクトリに格納されますので、取り出してください

このあと、自分のpdfを作成するためのソースの変更方法などの詳細は、本ソフトで生成されたファイルが[本ソフトの取扱説明書](/dist/beamer-example.pdf)となりますので、参照ください

## Textlint
<!-- textlint-disable prh -->
本リポジトリで使用する自動校正にて使用するルールは [リンク先](src/commons1/docs/Textlint.md)にて説明しています
<!-- textlint-enable prh -->

## CI/CD
本リポジトリで使用するCI/CDにて使用するルールは [リンク先](src/commons/docs1/CICD.md)にて説明しています

## License
"beamer-example" の各ソースコードは [MIT license](https://ja.wikipedia.org/wiki/MIT_License) で配布します。  
また、このコードで生成されたファイルは、[本ソフトの取扱説明書](/dist/beamer-example.pdf)となっていて、[クリエイティブ・コモンズ・ライセンス](https://ja.wikipedia.org/wiki/%E3%82%AF%E3%83%AA%E3%82%A8%E3%82%A4%E3%83%86%E3%82%A3%E3%83%96%E3%83%BB%E3%82%B3%E3%83%A2%E3%83%B3%E3%82%BA%E3%83%BB%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9)表示 4.0 国際で配布します

## Author
* 作成者 : ichmy55
* 所属   : 
