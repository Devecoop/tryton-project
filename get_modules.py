#!/usr/bin/env python

from __future__ import (absolute_import, division, print_function,
                        unicode_literals)

import json
from collections import defaultdict
from os import path

from vcstools import get_vcs_client

CURRENT_DIR = path.dirname(path.abspath(__file__))
REPO_CONF_FILE = path.join(CURRENT_DIR, 'modules.json')
MODULES_DIR = path.join(CURRENT_DIR, 'modules')

DEFAULT_VERSION = defaultdict(lambda: 'master', {
    'hg': 'default',
})


conf_file = open(REPO_CONF_FILE, 'r')
conf_data = json.load(conf_file)
conf_file.close()

for module, conf in conf_data.iteritems():
    module_path = path.join(MODULES_DIR, module)
    module_ver = conf.get('version', DEFAULT_VERSION[conf['vcs']])

    client = get_vcs_client(conf['vcs'],
                            module_path)

    if not client.path_exists():
        print()
        print("Clonning into '%s'..." % (module,))
        client.checkout(conf['url'], version=module_ver)
    else:
        print()
        print("Updating '%s'..." % (module,))
        client.update(version=module_ver)
