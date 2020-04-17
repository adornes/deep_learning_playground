FROM jupyter/tensorflow-notebook:latest

USER root

RUN pip install --upgrade pip

RUN mkdir -p /home/adornes/.jupyter/custom/
RUN echo '.container { width:95% !important; }' > /home/adornes/.jupyter/custom/custom.css

COPY requirements.txt /home/adornes/requirements.txt

WORKDIR /home/adornes

RUN pip install -r requirements.txt

RUN jupyter nbextension install --py jupyter_dashboards --sys-prefix
RUN jupyter nbextension enable --py jupyter_dashboards --sys-prefix

RUN sed -i "s/echo \"Executing the command/#/g" /usr/local/bin/start.sh
RUN sed -i "s/@\"/@\" \"--NotebookApp.token=$NOTEBOOK_PASSWORD\"/g" /usr/local/bin/start-notebook.sh

RUN mkdir /home/adornes/data
RUN mkdir /home/adornes/notebook
RUN mkdir /home/adornes/src

COPY data /home/adornes/data
COPY jupyter_notebook /home/adornes/notebook
COPY src /home/adornes/src

CMD ["start-notebook.sh"]
