STAGING_DIR=STAGING/com.palm.app.shapespin

rm -rf $STAGING_DIR
rm *.ipk
mkdir -p $STAGING_DIR
rsync -r --exclude=.DS_Store --exclude=.svn mojo/ $STAGING_DIR/
(cd plugin && ./buildit_for_device.sh)
cp plugin/shapespin_plugin $STAGING_DIR
echo "filemode.755=shapespin_plugin" > $STAGING_DIR/package.properties
pdk-package $STAGING_DIR
