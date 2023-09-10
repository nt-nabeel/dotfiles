install:
	@echo Starting installation dotfiles
	@echo Installation alacritty ...
	./cmd/create-symbolic-link $(shell pwd)/alacritty $(HOME)/.config/alacritty
	@echo Installation tmux ...
	./cmd/create-symbolic-link $(shell pwd)/tmux $(HOME)/.config/tmux
	./cmd/create-symbolic-link $(shell pwd)/tmux.conf $(HOME)/.tmux.conf
	@echo Installation dotfiles finish
