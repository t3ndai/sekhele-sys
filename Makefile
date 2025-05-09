deploy:
	rsync -avPz -e "ssh -i ~/.ssh/hetzner" . dzonga@188.245.145.67:/home/dzonga/sekhele-sys
	ssh -l dzonga 2a01:4f8:1c1c:c607::1 "cd ~/sekhele-sys && sudo -S docker compose build && sudo -S docker compose up -d"
