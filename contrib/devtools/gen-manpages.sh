#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOINNOOMYD=${BITCOINNOOMYD:-$SRCDIR/bitcoinnoomyd}
BITCOINNOOMYCLI=${BITCOINNOOMYCLI:-$SRCDIR/bitcoinnoomy-cli}
BITCOINNOOMYTX=${BITCOINNOOMYTX:-$SRCDIR/bitcoinnoomy-tx}
BITCOINNOOMYQT=${BITCOINNOOMYQT:-$SRCDIR/qt/bitcoinnoomy-qt}

[ ! -x $BITCOINNOOMYD ] && echo "$BITCOINNOOMYD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BNYVER=($($BITCOINNOOMYCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoinnoomyd if --version-string is not set,
# but has different outcomes for bitcoinnoomy-qt and bitcoinnoomy-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOINNOOMYD --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOINNOOMYD $BITCOINNOOMYCLI $BITCOINNOOMYTX $BITCOINNOOMYQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BNYVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BNYVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
