#
# Docker コマンドマクロ
#
COMPOSE := docker compose
#
# Latex エンジン
#
LATEXENG := lualatex
#
# 作成するスライド名
#
DEST_PDF := beamer-example
#
# ソースファイル一覧
#
SRCDIR := src
SRCS := $(wildcard  $(SRCDIR)/*.tex) $(wildcard $(SRCDIR)/images/*)

#
# Latex コンパイル方法の定義マクロ
#
define F2
$(2): $(1)
	@$(LATEXENG)$(1)
	mv main.pdf $(2)
	rm -f main.*
endef

#
# ターゲット一覧
#
.PHONY: up ps stop down  clean build bash localbuild localclean localtest
#
# Docker compose 制御ターゲット
#
# コンテナを初期設定します
up:
	@$(COMPOSE) up -d
	make clean
#
# コンテナを確認します
ps:
	@$(COMPOSE) ps
#
# コンテナの停止
stop:
	@$(COMPOSE) stop
#
# コンテナを停止し，upで作成したコンテナ，ネットワーク，ボリューム，イメージを削除
# 
down:
	@$(COMPOSE) down --rmi all
#
# コンテナ上のデータ整理（いったん全部消して、ローカルから持上）
# 
clean:
	@$(COMPOSE) exec -it beamer-example rm -rf *
	@$(COMPOSE) cp Makefile beamer-example:/home/user/
	@$(COMPOSE) cp src beamer-example:/home/user/src
	@$(COMPOSE) exec -it beamer-example mkdir dist
#
# コンテナ上のビルド
# 
build:
	make clean
	@$(COMPOSE) exec -it beamer-example make localbuild
	@$(COMPOSE) cp beamer-example:/home/user/dist .
#
# コンテナへのログイン
# 
bash:
	@$(COMPOSE) exec -it beamer-example bash
#
# ローカルでのビルド関連ターゲット
#
localbuild: pdf-files

pdf-files: $(addprefix dist/,$(addsuffix .pdf,$(DEST_PDF)))

$(addprefix dist/,$(addsuffix .pdf,$(DEST_PDF))) : $(SRCS)
	@$(LATEXENG) src/000-main.tex
	mv 000-main.pdf $@
	rm -f 000-main.*

localclean:
	rm -f  000-main.* dist/*
