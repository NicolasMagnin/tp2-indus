FROM python:3.9

WORKDIR /code

COPY ./setup.py /code/setup.py

COPY ./requirements.txt /code/requirements.txt

COPY ./README.md /code/README.md

COPY ./src /code/src

RUN pip install /code

RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

USER nonroot

COPY ./controller /code/controller

CMD ["uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]
