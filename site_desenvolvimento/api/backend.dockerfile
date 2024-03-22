FROM python:3.12

# Super usuario

USER root

# Copias pasta SRC 

# COPY ./src/fastapi-modelo /src/fastapi-modelo

# COPY ./src/requirements.txt /src/requirements.txt

# Criar pasta de trabalho

WORKDIR /src

# Criar ambiente virtualizado 

RUN python -m venv ./venv

# Se ja tiver o arquivo requirements.txt

# RUN pip install -r requirements.txt

# Install dependencies
RUN . ./venv/bin/activate

RUN pip install fastapi uvicorn

RUN pip install psycopg2 psycopg2-binary

# Create requirements.txt

RUN pip freeze > requirements.txt

WORKDIR /src/fastapi-modelo

# Expose port 8081
EXPOSE 8081

# Command to run the FastAPI server
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8081", "--reload"]

# RUN uvicorn app:app --host 0.0.0.0 --port 8081 --reload

ENTRYPOINT ["tail", "-f", "/dev/null"]