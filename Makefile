install:
	@echo Starting installation dotfiles
	@echo Installation alacritty ...
	./cmd/create-symbolic-link $(shell pwd)/alacritty $(HOME)/.config/alacritty
	@echo Installation dotfiles finish
