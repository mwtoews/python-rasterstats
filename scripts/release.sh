#!/bin/bash

python setup.py sdist --formats=gztar,zip bdist_wheel
# Redirect any warnings and check for failures
if [[ -n $(twine check dist/* 2>/dev/null | grep "Failed") ]]; then
    echo "Detected invalid markup, exiting!"
    exit 1
fi
twine upload dist/*

echo "Don't forget to publish the docs..."
echo "  cd docs && make zip  # then manually upload via https://pypi.python.org/pypi?%3Aaction=pkg_edit&name=rasterstats"
