# Breadcrumbs+ v2.0
#
# The Breadcrumbs+ extension is for CMS Opencart 3.x.
# The module allows to manage product breadcrumbs.
#
# <https://www.opencart.com/index.php?route=marketplace/extension/info&extension_id=35022>
# <https://underr.space/notes/projects/project-008.html>
# <https://github.com/underr-ua/ocmod3-breadcrumbs-plus>
#
# This file is subject to the End Use License Agreement (EULA) <https://raw.githubusercontent.com/underr-ua/ocmod3-breadcrumbs-plus/master/EULA.txt>
#
# Copyright (c) 2019 Andrii Burkatskyi aka underr

zip=$(shell basename `pwd`).ocmod.zip

eula=EULA.txt
readme=README.md
datetime=201901010000.00
src=src
bin=bin
filename=config.txt

all: checkg clean makedir timestamp makezip hideg

checkg:
	@if [ ! -f "hideg.pwd" ]; then hideg; fi

makedir:
	mkdir -p "$(bin)"

timestamp:
	find . -exec touch -a -m -t $(datetime) {} \;

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd .. && zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(eula)"

hideg: hideg.pwd
	hideg "$(bin)/$(zip)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(bin)"/*.zip
