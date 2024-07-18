FROM jupyter/base-notebook:latest

USER $NB_UID

# Instalar librerías de Python
RUN pip install pandas sqlalchemy pymysql psycopg2-binary

COPY . /home/jovyan/work
WORKDIR /home/jovyan/work

# Deshabilitar la autenticación por token
RUN echo "c.ServerApp.token = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py
RUN echo "c.ServerApp.password = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py