set STAGING_DIR=STAGING\com.palm.app.shapespin


rmdir /s /y %STAGING_DIR%
del *.ipk
mkdir %STAGING_DIR%
xcopy /s /y mojo %STAGING_DIR%
cd plugin
call buildit.cmd
cd ..
copy plugin\shapespin_plugin %STAGING_DIR%
echo filemode.755=shapespin_plugin > %STAGING_DIR%\package.properties
pdk-package %STAGING_DIR%
