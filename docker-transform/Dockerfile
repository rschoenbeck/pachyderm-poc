FROM python:3.6.8-slim

WORKDIR /transform

COPY requirements.txt /transform
RUN pip install -r requirements.txt

COPY loan_transform.py /transform
RUN mkdir /pfs
RUN mkdir /pfs/out
