FROM python:3.8.1-slim-buster

RUN apt-get update && \ 
    apt-get install nano git -y

RUN pip install jupyter

RUN apt-get -yqq autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/goatchurchprime/jupyter_micropython_kernel \
    && pip install -e jupyter_micropython_kernel \
    && python -m jupyter_micropython_kernel.install

WORKDIR /root
USER root

RUN mkdir /notebooks

WORKDIR /notebooks
ADD resources/example.ipynb /notebooks

RUN jupyter notebook --generate-config

ENV CONFIG_PATH="/root/.jupyter/jupyter_notebook_config.py"

COPY "resources/jupyter_notebook_config.py" ${CONFIG_PATH}

EXPOSE 8888
ENTRYPOINT ["sh", "-c", "jupyter notebook --allow-root -y --no-browser --ip=0.0.0.0 --config=${CONFIG_PATH}"]
