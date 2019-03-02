# Custom aliases
alias zshconfig="vim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias session="tmuxifier load-session"
alias window="tmuxifier load-window"
alias ports="netstat -tulpn"
alias start_tmux="tmux attach-session -t ssh || tmux new-session -s ssh"

# Docker Aliases
alias dmysql="docker run --link mariadb:mysql -it arey/mysql-client -h mysql -p"
alias dphpcs="docker run --rm -ti -v $(pwd):/project herloct/phpcs --standard=PSR1,PSR2"
alias dphpcbf="docker run --rm -ti --user $(id -u):$(id -g) -v $(pwd):/project herloct/phpcbf --no-patch --standard=PSR1,PSR2"
alias dnpm="docker run --rm -ti --add-host npm.local:127.0.0.1 -e HOST=npm.local -v $(pwd):/src -p 8090:8080 --name npm sdaoudi/node:8-alpine"
