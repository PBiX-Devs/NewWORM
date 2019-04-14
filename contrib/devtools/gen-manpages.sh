#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

WORMD=${WORMD:-$SRCDIR/wormd}
WORMCLI=${WORMCLI:-$SRCDIR/worm-cli}
WORMTX=${WORMTX:-$SRCDIR/worm-tx}
WORMQT=${WORMQT:-$SRCDIR/qt/worm-qt}

[ ! -x $WORMD ] && echo "$WORMD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($WORMCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for wormd if --version-string is not set,
# but has different outcomes for worm-qt and worm-cli.
echo "[COPYRIGHT]" > footer.h2m
$WORMD --version | sed -n '1!p' >> footer.h2m

for cmd in $WORMD $WORMCLI $WORMTX $WORMQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
