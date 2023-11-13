install: uninstall
	pip3 install .

test1:
	civitdl batchstr '123456,78901,23456' ./test/models/test1

test2:
	civitdl batchfile ./test/batchtest1.txt ./test/models/test2

test: dev test1 test2


clean:
	rm -rf **/*.egg-info
	rm -rf dist build
	rm -rf ./test/models

uninstall: clean
	pip3 uninstall civitdl -y
