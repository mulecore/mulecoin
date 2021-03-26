#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

MULECOIND=${MULECOIND:-$SRCDIR/mulecoind}
MULECOINCLI=${MULECOINCLI:-$SRCDIR/mulecoin-cli}
MULECOINTX=${MULECOINTX:-$SRCDIR/mulecoin-tx}
MULECOINQT=${MULECOINQT:-$SRCDIR/qt/mulecoin-qt}

[ ! -x $MULECOIND ] && echo "$MULECOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
FOXDVER=($($MULECOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for mulecoind if --version-string is not set,
# but has different outcomes for mulecoin-qt and mulecoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$MULECOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $MULECOIND $MULECOINCLI $MULECOINTX $MULECOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${FOXDVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${FOXDVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
