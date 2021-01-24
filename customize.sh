# Make sure MAGISKTMP is not empty
[ -d "/sbin/.magisk" ] && MAGISKTMP="/sbin/.magisk" || MAGISKTMP="$(find /dev -mindepth 2 -maxdepth 2 -type d -name ".magisk")"

# Start installation
mkdir -p $MODPATH/system/vendor/etc
ui_print "- Copying mixer_paths_tasha.xml to the module directory"
cp -f $MAGISKTMP/mirror/system/vendor/etc/mixer_paths_tasha.xml $MODPATH/system/vendor/etc/mixer_paths_tasha.xml
ui_print "- Patching mixer_paths_tasha.xml to enable stereo effect"
. $MODPATH/.aml.sh
ui_print "- Finalizing permissions"
set_perm_recursive $MODPATH 0 0 0755 0644
