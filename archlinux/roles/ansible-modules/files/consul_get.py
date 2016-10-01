import sys

try:
    import consul
    from requests.exceptions import ConnectionError
    python_consul_installed = True
except ImportError, e:
    python_consul_installed = False

from requests.exceptions import ConnectionError

def execute(module):
    get_value(module)

def get_consul_api(module, token=None):
    return consul.Consul(host=module.params.get('host'),
                         port=module.params.get('port'),
                         scheme=module.params.get('scheme'),
                         verify=module.params.get('validate_certs'),
                         token=module.params.get('token'))

def get_value(module):
    consul_api = get_consul_api(module)

    session = module.params.get('session')
    key = module.params.get('key')

    index, value = consul_api.kv.get(key)

    module.exit_json(
        index=index,
        key=key,
        data=value)

def test_dependencies(module):
    if not python_consul_installed:
        module.fail_json(msg="python-consul required for this module. "\
              "see http://python-consul.readthedocs.org/en/latest/#installation")

def main():
    argument_spec = dict(
        #cas=dict(required=False),
        #flags=dict(required=False),
        key=dict(required=True),
        host=dict(default='localhost'),
        scheme=dict(required=False, default='http'),
        validate_certs=dict(required=False, default=True),
        port=dict(default=8500, type='int'),
        #recurse=dict(required=False, type='bool'),
        #retrieve=dict(required=False, default=True),
        #state=dict(default='present', choices=['present', 'absent', 'acquire', 'release']),
        token=dict(required=False, default='anonymous', no_log=True),
        #value=dict(required=False),
        session=dict(required=False)
    )

    module = AnsibleModule(argument_spec, supports_check_mode=False)

    test_dependencies(module)

    try:
        execute(module)
    except ConnectionError, e:
        module.fail_json(msg='Could not connect to consul agent at %s:%s, error was %s' % (
                            module.params.get('host'), module.params.get('port'), str(e)))
    except Exception, e:
        module.fail_json(msg=str(e))


# import module snippets
from ansible.module_utils.basic import *
if __name__ == '__main__':
    main()
