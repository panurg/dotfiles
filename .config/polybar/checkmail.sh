#!/usr/bin/env sh

fetchmail -c 2>/dev/null | (
   global_count=0

   while read line; do
      total=$(echo $line | cut -d " " -f1)
      seen=$(echo $line | cut -d " " -f3 | sed 's/(//')
      unread=$(echo "$total - $seen" | bc)
      # mbox=$(echo $line | cut -d " " -f8)
      # case $mbox in
      #    "localhost.")
      #       mbox="Mera"
      #       ;;
      #    "webmail.ascom-resource.com.")
      #       mbox="Ascom"
      #       ;;
      #    *)
      #       mbox="Unknown"
      #       ;;
      # esac

      # if [ $unread -gt 0 ]
      # then
      #    [ $unread -eq 1 ] && suffix="" || suffix="s"
      #    dunstify -i mail-unread "$unread new mail$suffix" "at $mbox mailbox"
      # fi

      global_count=$(expr $global_count + $unread)
   done

   if [ $global_count -gt 0 ]
   then
      echo " $global_count"
   fi
)

