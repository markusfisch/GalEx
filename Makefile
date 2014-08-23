HTDOCS = htdocs
SPRITES = sprites/*
WEBROOT = hhsw.de@ssh.strato.de:sites/proto/ld30
OPTIONS = \
	--recursive \
	--links \
	--update \
	--delete-after \
	--times \
	--compress

live: $(HTDOCS)/atlas.png
	rsync $(OPTIONS) \
		$(HTDOCS)/* \
		$(WEBROOT)

$(HTDOCS)/atlas.png: $(SPRITES)
	cd $(HTDOCS) && \
		mkatlas ../$(SPRITES) | \
		patchatlas index.html
