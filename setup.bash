#!/bin/bash
pip install -r requirements.txt
python setup.py
find . | grep -v -E "(abis|interfaces|deployments|index.html)" | xargs rm -rf
