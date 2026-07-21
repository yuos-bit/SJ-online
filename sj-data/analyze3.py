# -*- coding: utf-8 -*-
"""Extract all item IDs from guide data, check for item names in all data"""
import json, os, re

data_dir = r'data\json'
js_dir = r'data\scripts'

# 1. Extract all IDs from guide data
print("=== All IDs from guide data ===")
with open(os.path.join(data_dir, '3b0d681c60e57db4.json'), 'r', encoding='utf-8') as f:
    guide = json.load(f)

all_ids = set()
for item in guide:
    if isinstance(item, dict):
        for key in ['triggerType', 'completeType', 'completeIds', 'id', 'groupId', 'minGroupId', 'spriteId', 'nextId']:
            if key in item:
                val = item[key]
                if isinstance(val, list):
                    for v in str(val).replace('[', '').replace(']', '').split(','):
                        v = v.strip()
                        if v.isdigit() and len(v) >= 3 and int(v) > 0:
                            all_ids.add(int(v))
                elif isinstance(val, (int, float)):
                    all_ids.add(int(val))

# Categorize IDs
print("Guide IDs (grouped by magnitude):")
for n in sorted(all_ids):
    if n >= 100000 and n <= 999999:
        print("  Guide Condition ID: %d" % n)
    elif n >= 10000 and n <= 99999:
        print("  Task/Guide ID: %d" % n)
    elif n >= 1000 and n <= 9999:
        print("  NPC/Scene ID: %d" % n)
    elif n >= 100 and n <= 999:
        print("  Small ID: %d" % n)

# 2. Check for item data in the main JS - look for specific patterns
print("\n\n=== Searching main JS for item config ===")
fn = 'f91bfe6775e8406d6e6bc756cb64f74f.js'
fp = os.path.join(js_dir, fn)
with open(fp, 'rb') as f:
    content = f.read()
text = content.decode('utf-8', errors='replace')

# Look for item config patterns
# In Egret, item configs might be loaded as a JSON and stored
# Let's search for the "item_icon" reference pattern
for m in re.finditer(r'item_icon', text):
    start = max(0, m.start()-50)
    end = min(len(text), m.end()+100)
    ctx = text[start:end]
    if any(ord(c) > 127 for c in ctx):
        print("item_icon context: %s" % repr(ctx[:200]))
        break

# Also search for the NPC names from the guide as a reference
npc_names = ['世界村村长', '云裳', '东海', '仓库管理员', '城市守卫', '游戏攻略师', '武器大师', '琪琪']
for name in npc_names:
    idx = text.find(name)
    if idx >= 0:
        start = max(0, idx-50)
        end = min(len(text), idx+100)
        print("NPC '%s': %s" % (name, repr(text[start:end])))
    else:
        print("NPC '%s': NOT FOUND" % name)

# 3. Check for any item name lists in the remaining JSON files
print("\n\n=== Checking remaining JSON files ===")
files = sorted(set([f for f in os.listdir(data_dir) if f.endswith('.json') and '_' not in f]))
skip = ['302.json', 'bb08bff6645c0279.json', '4671b4158d59f7de.json', 'b8d278f897be900a.json',
        '8081deeb943e94d4.json', '7344e54f1366dd79.json', 'ed325fc2deef3306.json', '2a99b06fcb9bb315.json',
        'resource_4498fd28eb56.json', '3b0d681c60e57db4.json']

for fn in files:
    if fn in skip:
        continue
    fp = os.path.join(data_dir, fn)
    size = os.path.getsize(fp)
    if size > 100000:
        continue
    try:
        with open(fp, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except:
        continue
    if isinstance(data, list) and len(data) > 0:
        if isinstance(data[0], str):
            try:
                first = json.loads(data[0])
                key = first.get('key', '')
                if any(x in key for x in ['assets/map', 'Skin', 'resource/ui/', 'eui', 'skins.']):
                    continue
                val = first.get('value', {})
                if isinstance(val, dict):
                    if 'name' in val or 'Name' in val:
                        print("  %s: has name field, key=%s" % (fn, key[:80]))
            except:
                pass
        elif isinstance(data[0], dict):
            keys = list(data[0].keys())
            if any(k in keys for k in ['mW', 'tiles', 'frames']):
                continue
            if 'id' in keys and 'name' in keys:
                print("  %s: %d items with id+name, keys=%s" % (fn, len(data), keys[:8]))
                for i in range(min(3, len(data))):
                    print("    [%d]: %s" % (i, json.dumps(data[i], ensure_ascii=False)[:200]))