if xwininfo -tree -root | grep metask
then
echo exists
else
  echo make
  exec terminology -n metask
fi

