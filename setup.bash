#!/bin/bash
pip install -r requirements.txt
# find . -depth 1 -type f | grep -v -E "(abis|interfaces|deployments|setup)" | xargs rm -rf
mkdir registry
mv abis interfaces deployments registry/
python setup.py
