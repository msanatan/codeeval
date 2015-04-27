#!/usr/bin/env python3
import json
import sys

def get_items_total(json_string):
    menu_json = json.loads(json_string)
    total = 0
    for item in menu_json['menu']['items']:
        if item is not None and 'label' in item:
            total += item['id']
    return total


if __name__ == '__main__':
    with open(sys.argv[1], 'r') as f:
        for menu in f.readlines():
            menu = menu.strip()
            if menu is not '':
                print(get_items_total(menu))
