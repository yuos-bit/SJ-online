# -*- coding: utf-8 -*-
"""Final comprehensive analysis of game data"""
import json, os, re

data_dir = r'data\json'
js_dir = r'data\scripts'

print("=" * 70)
print("GAME DATA COMPREHENSIVE ANALYSIS")
print("=" * 70)

# 1. Item icon ranges from sprite sheets
print("\n1. ITEM ICON INDEX MAPPING (from sprite sheets)")
print("-" * 60)
with open(os.path.join(data_dir, 'bb08bff6645c0279.json'), 'r', encoding='utf-8') as f:
    sheet = json.load(f)

for entry_str in sheet:
    entry = json.loads(entry_str)
    key = entry.get('key', '')
    if 'item_icon' in key.lower() or 'item_pet' in key.lower() or 'item_mount' in key.lower():
        val = entry.get('value', {})
        frames = val.get('frames', {})
        sheet_name = key.replace('resource/ui/', '').replace('.json', '')
        keys = sorted(frames.keys(), key=lambda x: int(x) if str(x).isdigit() else float('inf'))
        print("  %s: %d icons" % (sheet_name, len(keys)))
        # Group ranges
        numeric_keys = [k for k in keys if str(k).isdigit()]
        if numeric_keys:
            nk = sorted(numeric_keys, key=int)
            ranges = []
            start = int(nk[0])
            end = int(nk[0])
            for k in nk[1:]:
                ki = int(k)
                if ki == end + 1:
                    end = ki
                else:
                    ranges.append((start, end))
                    start = ki
                    end = ki
            ranges.append((start, end))
            for s, e in ranges:
                if s == e:
                    print("    %d" % s)
                else:
                    print("    %d ~ %d" % (s, e))
        # Non-numeric keys
        non_numeric = [k for k in keys if not str(k).isdigit()]
        if non_numeric:
            print("    Named icons: %s" % ", ".join(non_numeric))

# 2. Item ID ranges from API doc
print("\n2. ITEM ID RANGES (from API documentation)")
print("-" * 60)
print("  0-299    : 基础道具/消耗品 (Basic items/consumables)")
print("  8001-8841: 装备/武器 (Equipment/weapons)")
print("  8901-9098: 特殊道具 (Special items)")
print("  5125     : 宠物相关 (Pet-related)")
print("  8241     : 坐骑相关 (Mount-related)")
print("  8652-8689: 时装相关 (Fashion related)")
print("")
print("  Note: itemId (物品模板ID) != icon index (图标索引)")
print("  The itemId is the server-side identifier, while the icon index")
print("  references a specific frame in the item_icon sprite sheets.")

# 3. Item quality mapping
print("\n3. QUALITY MAPPING")
print("-" * 60)
print("  Quality 1: 普通 (Normal) - White")
print("  Quality 2: 精致 (Fine) - Green")
print("  Quality 3: 稀有 (Rare) - Blue")
print("  Quality 4: 史诗 (Epic) - Orange")
print("  Quality 5: 传说 (Legendary) - Purple")

# 4. Bag type mapping
print("\n4. BAG TYPE MAPPING")
print("-" * 60)
print("  bagType 0: 普通背包 (Normal bag)")
print("  bagType 1: 仓库 (Warehouse)")
print("  bagType 2: 临时背包 (Temporary bag)")

# 5. Price type mapping
print("\n5. PRICE TYPE MAPPING")
print("-" * 60)
print("  priceType 1: 银两 (Silver)")
print("  priceType 2: 黄金 (Gold)")
print("  priceType 3: 绑定金叶 (Bound gold leaf)")

# 6. Item properties from protocol
print("\n6. ITEM PROPERTIES (from bag protocol)")
print("-" * 60)
print("  uid:         物品唯一ID (unique item instance ID)")
print("  itemId:      物品模板ID (item template ID)")
print("  count:       数量 (quantity)")
print("  slot:        格子位置 (bag slot position)")
print("  bind:        是否绑定 (is bound)")
print("  quality:     品质 (quality 1-5)")
print("  durability:  当前耐久 (current durability)")
print("  maxDurability: 最大耐久 (max durability)")
print("  isEquiped:   是否已装备 (is equipped)")

# 7. Currency types from login protocol
print("\n7. CURRENCY TYPES")
print("-" * 60)
print("  gold:      黄金 (Premium currency, from recharge)")
print("  silver:    银两 (Game currency, from quests/selling)")
print("  bindGold:  绑定金叶 (Bound gold leaf)")

# 8. Check what data files are used
print("\n8. CONFIG FILES LOADED BY GAME")
print("-" * 60)
with open(os.path.join(data_dir, '302.json'), 'r', encoding='utf-8') as f:
    raw = f.read()
start = raw.find('"cfg"')
bracket = raw.find('[', raw.find(':', start))
cbracket = raw.find(']', bracket)
cfg = json.loads(raw[bracket:cbracket+1])
for c in cfg:
    print("  %s" % c)

# 9. Guide data - item references
print("\n9. ITEM REFERENCES IN GUIDE/TUTORIAL DATA")
print("-" * 60)
with open(os.path.join(data_dir, '3b0d681c60e57db4.json'), 'r', encoding='utf-8') as f:
    guide = json.load(f)
all_ids = set()
for item in guide:
    if isinstance(item, dict):
        for key, val in item.items():
            if isinstance(val, list):
                for v in str(val).split(','):
                    v = v.strip().replace('[','').replace(']','')
                    if v.isdigit() and len(v) >= 4:
                        all_ids.add(int(v))
item_ids = sorted([n for n in all_ids if 100000 <= n <= 999999])
print("  Item/condition IDs referenced: %s" % item_ids[:20])

# 10. Server protocol info
print("\n10. SERVER CONFIGURATION")
print("-" * 60)
with open(os.path.join(data_dir, 'resource_4498fd28eb56.json'), 'r', encoding='utf-8') as f:
    config = json.load(f)
print("  serverType: %d" % config.get('serverType', 0))
print("  version: %d" % config.get('version', 0))
print("  codeVersion: %s" % config.get('codeVersion', ''))
print("  host: %s" % config.get('host', ''))
print("  port: %d" % config.get('port', 0))
print("  openPay: %d" % config.get('openPay', 0))