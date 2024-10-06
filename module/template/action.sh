MODPATH="${0%/*}"

# ensure not running in busybox ash standalone shell
set +o standalone
unset ASH_STANDALONE

sh $MODPATH/autopif.sh || exit 1

echo -e "\nDone!"

# warn since Magisk's implementation automatically closes if successful
if [ "$KSU" != "true" -a "$APATCH" != "true" ]; then
    echo -e "\nClosing dialog in 15 seconds ..."
    sleep 15
fi
