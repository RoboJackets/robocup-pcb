"""Run explicit JSON tool requests against a fresh Konnect connection."""
import json
import os
import subprocess
import sys

env = os.environ.copy()
env['KICAD_API_SOCKET'] = r'ipc://C:\Users\ethan\AppData\Local\Temp\kicad\api.sock'
exe = r'C:\Users\ethan\Documents\KiCad\10.0\3rdparty\plugins\com_github_mixelpixx_konnect\bin\konnect.exe'
proc = subprocess.Popen([exe], stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                        stderr=subprocess.DEVNULL, text=True, env=env)

def request(number, method, params):
    proc.stdin.write(json.dumps(dict(jsonrpc='2.0', id=number, method=method, params=params)) + '\n')
    proc.stdin.flush()
    while True:
        line = proc.stdout.readline()
        if not line:
            raise RuntimeError('Konnect closed its output')
        result = json.loads(line)
        if result.get('id') == number:
            return result

try:
    request(1, 'initialize', dict(protocolVersion='2025-06-18', capabilities={}, clientInfo=dict(name='codex', version='1')))
    proc.stdin.write('{"jsonrpc":"2.0","method":"notifications/initialized"}\n')
    proc.stdin.flush()
    for number, item in enumerate(json.loads(os.environ['PCB_REQUESTS']), 2):
        result = request(number, item.get('method', 'tools/call'), item['params'])
        print(json.dumps(result), flush=True)
        if result.get('error') or result.get('result', {}).get('isError'):
            sys.exit(1)
finally:
    proc.terminate()
