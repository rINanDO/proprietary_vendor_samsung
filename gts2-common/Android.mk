# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(filter gts28wifi gts28ltexx gts210wifi gts210ltexx,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libGLES_mali
LOCAL_CHECK_ELF_FILES := false
LOCAL_MODULE_OWNER := samsung
LOCAL_SRC_FILES := proprietary/system/vendor/lib/egl/libGLES_mali.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/egl

SYMLINKS := $(TARGET_OUT)/vendor
$(SYMLINKS):
	@mkdir -p $@/lib/hw
	@echo "Symlink: libOpenCL.so"
	$(hide) ln -sf egl/libGLES_mali.so $@/lib/libOpenCL.so
	@echo "Symlink: libOpenCL.so.1"
	$(hide) ln -sf egl/libGLES_mali.so $@/lib/libOpenCL.so.1
	@echo "Symlink: libOpenCL.so.1.1"
	$(hide) ln -sf egl/libGLES_mali.so $@/lib/libOpenCL.so.1.1

ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
	$(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)

include $(BUILD_PREBUILT)

endif
