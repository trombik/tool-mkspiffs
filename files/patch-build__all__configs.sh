--- build_all_configs.sh.orig	2018-06-13 13:18:49 UTC
+++ build_all_configs.sh
@@ -6,21 +6,21 @@
 set -e
 
 # Generic (default options)
-make dist
+%%MAKE_CMD%% %%MAKE_ARGS%% dist
 
 # Arduino ESP8266
-make clean
-make dist BUILD_CONFIG_NAME="-arduino-esp8266" \
+%%MAKE_CMD%% clean
+%%MAKE_CMD%% %%MAKE_ARGS%% dist BUILD_CONFIG_NAME="-arduino-esp8266" \
     CPPFLAGS="-DSPIFFS_USE_MAGIC_LENGTH=0 -DSPIFFS_ALIGNED_OBJECT_INDEX_TABLES=1"
 
 # Build configuration for arduino-esp32
-make clean
-make dist BUILD_CONFIG_NAME="-arduino-esp32" \
+%%MAKE_CMD%% clean
+%%MAKE_CMD%% %%MAKE_ARGS%% dist BUILD_CONFIG_NAME="-arduino-esp32" \
     CPPFLAGS="-DSPIFFS_OBJ_META_LEN=4"
 
 # Build configuration for ESP-IDF (esp32)
-make clean
-make dist BUILD_CONFIG_NAME="-esp-idf" \
+%%MAKE_CMD%% clean
+%%MAKE_CMD%% %%MAKE_ARGS%% dist BUILD_CONFIG_NAME="-esp-idf" \
     CPPFLAGS="-DSPIFFS_OBJ_META_LEN=4"
 
 
