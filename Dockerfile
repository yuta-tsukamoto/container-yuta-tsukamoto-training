#ビルドステージを初期化し、ベースイメージを指定する、(FROMで用いるためのARG命令を除いて)FROM命令によるビルドステージの上でのみ他の命令は動く(つまり複数のFROMを使用することによって違うベースイメージに基づいたイメージを1つのDockerfileで構築できる)
#基本DockerHubから取ってくるが、URIを指定することによって任意のイメージを引っ張って来れる？
#ここではDockerHubで公開されているPythonベースイメージを指定する
FROM python:3.9

#以降のコマンド(今回の場合はJupyter notebookのインストール)で使う作業ディレクトリを指定
WORKDIR /app

#使用するシェルを指定する。
#Linux標準シェルを指定していて、cオプションは文字列で渡されたものをコマンドとして評価するもの。
SHELL ["/bin/bash", "-c"]

#コマンドを実行する。シェルコマンドや実行ファイルを指定する
#引っ張ってきたpythonでJupyter notebookが使えるようにpipからインストールする
RUN apt-get update &
RUN pip install --upgrade pip 
RUN pip install notebook