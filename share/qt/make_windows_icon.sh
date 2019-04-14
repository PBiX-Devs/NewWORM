#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/worm.png
ICON_DST=../../src/qt/res/icons/worm.ico
convert ${ICON_SRC} -resize 16x16 worm-16.png
convert ${ICON_SRC} -resize 32x32 worm-32.png
convert ${ICON_SRC} -resize 48x48 worm-48.png
convert ${ICON_SRC} -resize 256x256 worm-256.png
convert worm-16.png worm-32.png worm-48.png worm-256.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/worm_testnet.png
ICON_DST=../../src/qt/res/icons/worm_testnet.ico
convert ${ICON_SRC} -resize 16x16 worm-16.png
convert ${ICON_SRC} -resize 32x32 worm-32.png
convert ${ICON_SRC} -resize 48x48 worm-48.png
convert ${ICON_SRC} -resize 256x256 worm-256.png
convert worm-16.png worm-32.png worm-48.png worm-256.png ${ICON_DST}
rm worm-16.png worm-32.png worm-48.png worm-256.png
