# Install script for directory: T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/led_strip")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "T:/ESP-IDF/tools/xtensa-esp32-elf/esp-2022r1-11.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-objdump.exe")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aes.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aria.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1write.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/base64.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/bignum.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/build_info.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/camellia.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ccm.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chacha20.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chachapoly.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/check_config.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cipher.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cmac.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/compat-2.x.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_psa.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/constant_time.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ctr_drbg.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/debug.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/des.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/dhm.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdh.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdsa.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecjpake.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecp.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/entropy.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/error.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/gcm.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hkdf.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hmac_drbg.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/legacy_or_psa.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/lms.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/mbedtls_config.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md5.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/net_sockets.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/nist_kw.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/oid.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pem.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pk.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs12.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs5.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs7.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_time.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_util.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/poly1305.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/private_access.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/psa_util.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ripemd160.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/rsa.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha1.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha256.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha512.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cache.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cookie.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ticket.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/threading.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/timing.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/version.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crl.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crt.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_csr.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_builtin_composites.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_builtin_primitives.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_compat.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_config.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_common.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_extra.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_platform.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_se_driver.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_sizes.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_struct.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_types.h"
    "T:/ESP-IDF/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_values.h"
    )
endif()

