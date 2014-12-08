#!/usr/bin/env python
# -*- coding: utf-8 -*

import sys
import os
import markdown2
import codecs


from jinja2 import Template


def set_work_dir():
    _ = os.path.dirname(os.path.realpath(__file__)) + "/../."
    prj_dir = os.path.normpath(_)
    os.chdir(prj_dir)
    print prj_dir


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.stderr.write("Usage: md_to_html.py path/file.md > file.html" + "\n")
        exit(1)

    md_file = sys.argv[1]
    script_dir = os.path.dirname(os.path.realpath(__file__))
    tmpl_fn = script_dir + "/template.html"

    with codecs.open(md_file, 'r', encoding='utf-8') as md:
        f_str = md.read()
        content = markdown2.markdown(f_str.encode('utf-8'), extras=["metadata"])
        tmpl = Template(open(tmpl_fn).read())
        output = tmpl.render({'content': content})
        print output.encode('utf-8')
