LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

$(call import-add-path,$(LOCAL_PATH)/../../cocos2d)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/external)
$(call import-add-path,$(LOCAL_PATH)/../../cocos2d/cocos)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

# cppファイルの自動検索設定
ifeq ($(HOST_OS),windows)
	CPP_FILES := $(shell dir $(LOCAL_PATH)/../../Classes/*.cpp /b/a-d/s)                   
else
	CPP_FILES := $(shell find $(LOCAL_PATH)/../../Classes -name *.cpp)                   
endif

# hellocppは各自直しますね
LOCAL_SRC_FILES := hellocpp/main.cpp
LOCAL_SRC_FILES += $(CPP_FILES:$(LOCAL_PATH)/%=%)


# headerフォルダの自動検索設定
ifeq ($(HOST_OS),windows)
	LOCAL_C_INCLUDES := $(shell dir $(LOCAL_PATH)/../../Classes /b/ad/s)                   
else
	LOCAL_C_INCLUDES := $(shell find $(LOCAL_PATH)/../../Classes -type d)                   
endif

ifeq ($(APP_OPTIM),debug)
	LOCAL_CFLAGS := -w -g
endif

#LOCAL_SRC_FILES := hellocpp/main.cpp \
#                   ../../Classes/AppDelegate.cpp \
#                   ../../Classes/HelloWorldScene.cpp
#
#LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes

# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END


LOCAL_STATIC_LIBRARIES := cocos2dx_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)

$(call import-module,.)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
