#!/bin/sh

cd /usr/share/kibana/plugins \
git clone https://github.com/bgoubot/kbn_c3js_vis.git c3_charts \
cd c3_charts \
npm install