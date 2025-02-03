#!/bin/bash
#Silvia Matin
#15/01/25
# Demana el valor d'una nota (enter) i diu si és
# D (0, 1, 2), C- (3 o 4), C+ (5 o 6),
# B (7 o 8) o A (9 o 10).
# estructura if-else
echo "Quina nota tens (un enter de 1 a 10)?"
read nota
if [ $nota -lt 0 ] || [ $nota -gt 10 ]; then
  echo "Nota fora de rang."
elif [ $nota -lt 3 ]; then
  echo "Tens una D."
elif [ $nota -lt 5 ]; then
  echo "Tens una C-."
elif [ $nota -lt 7 ]; then
  echo "Tens una C+."
elif [ $nota -lt 9 ]; then
  echo "Tens una B."
else
  echo "Tens una A."
fi
