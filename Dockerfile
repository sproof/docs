FROM ubuntu:xenial

# Install apt packages
RUN apt update && \
    apt upgrade -y && \
    apt install -y python-pip
RUN pip install --upgrade pip

# Clean downloaded apt packages after install
RUN apt clean && \
    apt autoremove
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install python packages
RUN pip install 'sphinx              == 1.6.2' && \
    pip install 'sphinx-autobuild    == 0.6.0' && \
    pip install 'sphinx_rtd_theme    == 0.2.4' && \
    pip install 'sphinx-tabs         == 1.1.10'

# Set the locale
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Expose sphinx-autobuild documentation served port
EXPOSE 8000

RUN mkdir /sphinx-doc

# Set runtime command to autobuild and serve documentation
WORKDIR /sphinx-doc
CMD sphinx-autobuild -b html --host 0.0.0.0 --port 8000 --poll /sphinx-doc /sphinx-doc/_build/html
