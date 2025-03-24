FROM python:3.9

RUN groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /code

COPY ./setup.py /code/setup.py
COPY ./requirements.txt /code/requirements.txt
COPY ./README.md /code/README.md
COPY ./src /code/src

RUN chown -R appuser:appuser /code

RUN pip install /code

COPY ./controller /code/controller

USER appuser

CMD ["uvicorn", "controller.controller:app", "--host", "0.0.0.0", "--port", "80"]