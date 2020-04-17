# Deep Learning Playground

Welcome to my Deep Learning Playground!

This is where I want to be posting great (hopefully beautiful, sophisticated and useful) code for trying out this amazing world of Artificial Neural Networks (ANNs) and a variety of possible applications.

Everything is ready to be run with [Docker](https://www.docker.com/) (!!), which makes life extremely easier for testing new technologies without struggling or messing up your own environment. Well, Docker has many other huge advantages. If you still don't know it, you should definitely check it out: https://www.docker.com/


## Docker image

This repo's Docker image is based [this image](https://hub.docker.com/r/jupyter/tensorflow-notebook/) which is a TensorFlow-ready Jupyter notebook.

Jupyter is also an essential tool for your toolkit. If you don't know it, must check it out too: https://jupyter.org/

## Build the Docker image

If you already have your environment set up with Docker, the next step is to build the Docker image from the root directory of this repo:

```
IMAGE_TAG=adornes-deep-learning-playground
docker build -t ${IMAGE_TAG} .
```

## Run it Locally

Once the Docker image is built, you can just run it at any time as follows:

```
IMAGE_TAG=adornes-deep-learning-playground
docker run -it -p 8898:8888 -v `pwd`/data:/home/adornes/data -v `pwd`/jupyter_notebook:/home/adornes/notebook -v `pwd`/src:/home/adornes/src ${IMAGE_TAG}
```
 
## Accessing the Jupyter notebooks

By default, Jupyter notebook are available on the port 8888. Here this is not different, except for the fact that our notebook is answering requests inside the Docker container, and the way we run it in the previous command we mapped the container's 8888 port to the port 8898 in our hosting machine.

So, in other words, you should be able to access the notebooks at [http://localhost:8898/tree/notebook](http://localhost:8898/tree/notebook).

## Run it somewhere else

Training ANNs requires A LOT of computational power. Even if you have a very good GPU with CUDA installed, you might want to run it in the cloud. I highly recommend [AWS Sagemaker](https://aws.amazon.com/sagemaker/), which I may further details here in the near future.
 
## Enjoy and contribute

I hope you enjoy it and please feel free to contribute!


