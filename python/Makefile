help:
	@echo "                                                     "
	@echo "                                                     "
	@echo "                                                     "
	@echo "make:"
	@echo "      clean: clean project"
	@echo "      lint: run pylint and flake8 on project"
	@echo "      test: run tests"
	@echo "      pypi: register and upload to pypi"
	@echo "      pypitest: register and upload to pypitest"
	@echo ""

clean:
	rm -f *.pyc
	rm -rf .tox
	rm -rf *.egg-info
	rm -rf __pycache__
	rm -f pip-selfcheck.json

lint:
	tox -e lint

test:
	tox

check: lint test

pypi:
	twine upload dist/*.tar.gz

release:
	git diff-index --quiet HEAD -- && make check && bumpversion patch && git push && make pypi
