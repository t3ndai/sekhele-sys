deploy:
	rsync -avPz -e "ssh -i ~/.ssh/hetzner" . dzonga@188.245.145.67:/home/dzonga/sekhele-sys
