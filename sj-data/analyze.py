# -*- coding: utf-8 -*-
"""Step by step analysis of JSON files"""
import json, os, glob

data_dir = r'd:\桌面\sj-data\data\json'

# Get all unique JSON files
files = sorted(set([f for f in os.listdir(data_dir) if f.endswith('.json') and '_' not in f]))

# Check JavaScript files for item ID definitions
js_dir = r'd:\桌面\sj-data\data\scripts'
print("=== Checking scripts for item definitions ===")
for fn in sorted(os.listdir(js_dir)):
    if fn.endswith('.js'):
        fp = os.path.join(js_dir, fn)
        try:
            with open(fp, 'r', encoding='utf-8') as f:
                content = f.read()
        except:
            continue
        # Check if this file contains item definitions
        kw = ['item_icon', 'itemName', 'itemsConf', 'itemConf', 'ItemConfig', 'ItemsConfig']
        if any(k in content for k in kw):
            print("  %s: contains item config keywords" % fn)
            # Find item patterns
            for line in content.split('\n')[:100]:
                if any(k in line for k in kw):
                    print("    -> %s" % line[:200])

# Now check the JSON files that are NOT config files
print("\n=== Checking other JSON files ===")
for fn in files:
    if fn in ['302.json', 'bb08bff6645c0279.json', '4671b4158d59f7de.json', 'b8d278f897be900a.json', '8081deeb943e94d4.json', '7344e54f1366dd79.json', 'ed325fc2deef3306.json', '2a99b06fcb9bb315.json', 'resource_4498fd28eb56.json']:
        continue
    fp = os.path.join(data_dir, fn)
    try:
        with open(fp, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except:
        continue
    if isinstance(data, list) and len(data) > 0 and len(data) < 200:
        if isinstance(data[0], dict):
            keys = list(data[0].keys())
            print("  %s: list[%d] keys=%s" % (fn, len(data), keys[:10]))
            for i in range(min(2, len(data))):
                s = json.dumps(data[i], ensure_ascii=False)[:250]
                print("    [%d]: %s" % (i, s))
    elif isinstance(data, dict):
        keys = list(data.keys())
        if any(kw in str(keys) for kw in ['item', 'Item', '道具']):
            print("  %s: dict keys=%s" % (fn, keys[:15]))