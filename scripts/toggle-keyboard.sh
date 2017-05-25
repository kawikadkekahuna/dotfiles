id=$(xinput list | grep "AT Translated Set 2 keyboard" | awk '{ print $7 }' | cut -f2 -d"=")

keyboard=$(xinput list | grep "AT Translated Set" | awk '{ print $8,$9 }')

if [ "$keyboard" == "[floating slave]" ]; then
  echo enabling keyboard
  xinput reattach $id 3
else
  echo disabling keyboard
  xinput float $id
fi




