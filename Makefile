install: uninstall
	pip3 install .

test1:
	civitdl batchstr '123456,78901,23456' ./test/models/test1

test2:
	civitdl batchfile ./test/batchtest1.txt ./test/models/test2

errortest1:
	civitdl batchfile ./test/errortest1.txt ./test/models/test2

test: install test1 test2


clean:
	rm -rf **/*.egg-info
	rm -rf dist build
	rm -rf ./test/models

uninstall: clean
	pip3 uninstall civitdl -y

clear:
	@rm -rf dist build

clear-win:
	@rd /s /q "dist"
	@rd /s /q "build"

build: clear-win
	@python setup.py bdist_wheel

publish: build
	@python -m twine upload dist/*
