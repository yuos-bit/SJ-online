# -*- coding: utf-8 -*-
"""Find item config - search for specific patterns in the huge JS file"""
import os, re, json

js_dir = r'data\scripts'
fn = 'f91bfe6775e8406d6e6bc756cb64f74f.js'
fp = os.path.join(js_dir, fn)
with open(fp, 'rb') as f:
    content = f.read()

text = content.decode('utf-8', errors='replace')

# Search for the item config data structure
# Look for patterns like "itemId" or "itemConf" or "ItemConfig"
# These might be object keys in the game code

# Search for patterns: itemsConf, itemConf, ItemConfig, ItemsConfig
for pat in ['itemsConf', 'itemConf', 'ItemConfig', 'ItemsConfig', 'itemConfig', 'ItemCfg', 'itemCfg', 'item_cfg', 'Item_Config']:
    idx = text.find(pat)
    if idx >= 0:
        print("'%s' found at %d" % (pat, idx))
        start = max(0, idx-50)
        end = min(len(text), idx+200)
        print("  ctx: %s" % repr(text[start:end]))

# Also search for the actual item data by looking for large arrays
# that contain both numbers and Chinese text
# Look for patterns like: [id, "name", icon, type, quality, ...]
print("\n\nSearching for item data arrays...")
count = 0
for m in re.finditer(r'\[(\d{1,5})\s*,\s*"([一-鿟一-鿿㐀-䶿][^"]{1,10})"\s*,\s*(\d+)', text):
    id_val = m.group(1)
    name = m.group(2)
    icon = m.group(3)
    print("  [%s, \"%s\", %s, ...]" % (id_val, name, icon))
    count += 1
    if count >= 30:
        break

# Try a different approach: look for the actual item data by searching for
# common item names from the game guide
print("\n\nSearching for game item names from guide...")
guide_items = ['宠物蛋', '野外修理卷', '药品']
for item in guide_items:
    idx = text.find(item)
    if idx >= 0:
        start = max(0, idx-100)
        end = min(len(text), idx+200)
        print("'%s' at %d: %s" % (item, idx, repr(text[start:end])))

# Search for the item data by looking at the structure pattern
# Common in Egret: items are stored as a large object with numeric keys
# like: {1:{name:"xxx",icon:1,...}, 2:{name:"yyy",...}}
# or as a large array: [{id:1,name:"xxx",...}, ...]

# Search for the pattern: "name":"Chinese" near numbers
print("\n\nSearching for {name:\"Chinese\"} near numbers...")
for m in re.finditer(r'"name"\s*:\s*"([一-鿟一-鿿][^"]{1,10})"', text):
    name = m.group(1)
    start = max(0, m.start()-80)
    end = min(len(text), m.end()+20)
    chunk = text[start:end]
    # Check if there's a number nearby
    nums = re.findall(r'\d{4,5}', chunk)
    if nums:
        print("  name='%s', nums=%s, ctx=%s" % (name, nums, repr(chunk[:150])))
    if m.start() > 5000000:
        break