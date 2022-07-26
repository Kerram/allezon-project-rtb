#!/bin/bash -v

source venv/bin/activate
uvicorn src.main:app --reload
