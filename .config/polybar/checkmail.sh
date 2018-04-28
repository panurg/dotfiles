#!/usr/bin/env sh

printout() {
   fetchmail -c 2>/dev/null | (
      global_count=0

      while read line; do
         total=$(echo $line | cut -d " " -f1)
         seen=$(echo $line | cut -d " " -f3 | sed 's/(//')
         unread=$(echo "$total - $seen" | bc)
         global_count=$(expr $global_count + $unread)
      done

      if [ $global_count -gt 0 ]
      then
         echo " $global_count"
      else
         echo ""
      fi
   )
}

trap 'echo %{T8}%{F#919191}refreshing%{F-}%{T-}' SIGUSR1
trap exit SIGINT

while true; do
   printout

   sleep 900 &
   wait
done
