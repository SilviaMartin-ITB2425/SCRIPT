#!/bin/bash
#Silvia Matin
#15/01/25
# Demana el valor d'una nota (enter) i diu si és
# D (0, 1, 2), C- (3 o 4), C+ (5 o 6),
# B (7 o 8) o A (9 o 10).
# estructura case

echo "Quina nota tens (enter de 1 a 10)?"
read NOTA
case "$NOTA" in
  [0-2])
    echo "Tens una D."
    ;;
  [34])
    echo "Tens una C-."
    ;;
  [56])
    echo "Tens una C+."
    ;;
  [78])
    echo "Tens una B."
    ;;
  9|10)
    echo "Tens una A."
    ;;
  *)
  echo "Nota fora de rang."
esac
