install:
	@echo Starting installation dotfiles
	@echo Installation alacritty ...
	./cmd/create-symbolic-link $(shell pwd)/alacritty $(HOME)/.config/alacritty
	@echo Installation tmux ...
	./cmd/create-symbolic-link $(shell pwd)/tmux $(HOME)/.config/tmux
	./cmd/create-symbolic-link $(shell pwd)/tmux.conf $(HOME)/.tmux.conf
	@echo Installation zsh ...
	./cmd/create-symbolic-link $(shell pwd)/zsh $(HOME)/.config/zsh
	./cmd/create-symbolic-link $(shell pwd)/zshrc $(HOME)/.zshrc
	./cmd/create-symbolic-link $(shell pwd)/zshrc $(HOME)/.zprofile
	./cmd/install-nvchad
	@echo Installation dotfiles finish
