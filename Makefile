HTDOCS = htdocs
SPRITES = sprites/*
WEBROOT = hhsw.de@ssh.strato.de:sites/galex
OPTIONS = \
	--recursive \
	--links \
	--update \
	--delete-after \
	--times \
	--compress

all: $(HTDOCS)/atlas.png live

live:
	rsync $(OPTIONS) \
		$(HTDOCS)/* \
		$(WEBROOT)

$(HTDOCS)/atlas.png: $(SPRITES)
	cd $(HTDOCS) && \
		MARGIN=2 mkatlas ../$(SPRITES) | \
		patchatlas index.html
