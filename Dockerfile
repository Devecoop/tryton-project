# Trytond 3.2 - Argentina modules
FROM devecoop/tryton:3.4
MAINTAINER Germán Podestá <german.podesta@devecoop.com>

RUN apt-get update && \
    apt-get install --no-install-recommends -q -y \
    swig libssl-dev build-essential

COPY requirements.txt ${TRYTON_DIR}/argentina-requirements.txt
RUN pip install -r ${TRYTON_DIR}/argentina-requirements.txt

# PyAfipWs doesn't handle well the dependencies so we have to install it that way
# (the dependencies are in requirements.txt)
RUN pip install "git+https://github.com/reingart/pyafipws@2.7#egg=pyafipws"

ADD trytond.conf ${TRYTON_DIR}
ADD modules.json ${TRYTON_DIR}

RUN pip install vcstools

ADD get_modules.py ${TRYTON_DIR}

ADD docker-entrypoint.sh /

CMD ["trytond", "-v", "-c", "/etc/trytond.conf"]
ENTRYPOINT ["/docker-entrypoint.sh"]
