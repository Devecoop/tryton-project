# Trytond 3.2 - Argentina modules
FROM devecoop/tryton:3.4
MAINTAINER Germán Podestá <german.podesta@devecoop.com>

COPY requirements.txt ${TRYTON_DIR}
RUN pip install -r ${TRYTON_DIR}/requirements.txt

ADD trytond.conf ${TRYTON_DIR}
ADD modules.json ${TRYTON_DIR}

RUN pip install vcstools

ADD get_modules.py ${TRYTON_DIR}

ADD docker-entrypoint.sh /

CMD ["trytond", "-v", "-c", "/etc/trytond.conf"]
ENTRYPOINT ["/docker-entrypoint.sh"]
