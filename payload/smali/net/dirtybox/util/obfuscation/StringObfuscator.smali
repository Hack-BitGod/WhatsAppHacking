.class public Lnet/dirtybox/util/obfuscation/StringObfuscator;
.super Ljava/lang/Object;
.source "StringObfuscator.java"


# static fields
.field private static DECODED_KEY:[B

.field private static ENCODED_KEY:Ljava/lang/String;

.field private static INITIALIZED:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static OBFUSCATION_CHARSET:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 20
    const-string v0, "7IPR19mk6hmUY+hdYUaCIw=="

    sput-object v0, Lnet/dirtybox/util/obfuscation/StringObfuscator;->ENCODED_KEY:Ljava/lang/String;

    .line 22
    const-string v0, "UTF-8"

    sput-object v0, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lnet/dirtybox/util/obfuscation/StringObfuscator;->INITIALIZED:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static initialize()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 26
    sget-object v2, Lnet/dirtybox/util/obfuscation/StringObfuscator;->INITIALIZED:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 29
    :try_start_a
    sget-object v2, Lnet/dirtybox/util/obfuscation/StringObfuscator;->ENCODED_KEY:Ljava/lang/String;

    sget-object v3, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_11
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_11} :catch_27

    move-result-object v0

    .line 33
    .local v0, "base64Bytes":[B
    invoke-static {v0, v4}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v2

    sput-object v2, Lnet/dirtybox/util/obfuscation/StringObfuscator;->DECODED_KEY:[B

    .line 34
    sget-object v2, Lnet/dirtybox/util/obfuscation/StringObfuscator;->DECODED_KEY:[B

    array-length v2, v2

    const/16 v3, 0x10

    if-eq v2, v3, :cond_2e

    .line 35
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Encoded key is invalid"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 30
    .end local v0    # "base64Bytes":[B
    :catch_27
    move-exception v1

    .line 31
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 38
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "base64Bytes":[B
    :cond_2e
    return-void
.end method

.method public static obfuscate(Ljava/lang/String;)Ljava/lang/String;
    .registers 18
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {}, Lnet/dirtybox/util/obfuscation/StringObfuscator;->initialize()V

    .line 44
    :try_start_3
    sget-object v14, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_a} :catch_59

    move-result-object v13

    .line 50
    .local v13, "unencryptedBytes":[B
    :try_start_b
    const-string v14, "AES/CTR/NoPadding"

    invoke-static {v14}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_10
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_b .. :try_end_10} :catch_60
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_b .. :try_end_10} :catch_80

    move-result-object v2

    .line 54
    .local v2, "cipher":Ljavax/crypto/Cipher;
    new-instance v11, Ljavax/crypto/spec/SecretKeySpec;

    sget-object v14, Lnet/dirtybox/util/obfuscation/StringObfuscator;->DECODED_KEY:[B

    const-string v15, "AES"

    invoke-direct {v11, v14, v15}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 55
    .local v11, "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/16 v14, 0x10

    new-array v9, v14, [B

    .line 56
    .local v9, "iv":[B
    new-instance v12, Ljava/security/SecureRandom;

    invoke-direct {v12}, Ljava/security/SecureRandom;-><init>()V

    .line 57
    .local v12, "sr":Ljava/security/SecureRandom;
    invoke-virtual {v12, v9}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 58
    new-instance v10, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v10, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 60
    .local v10, "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v14, 0x1

    :try_start_2c
    invoke-virtual {v2, v14, v11, v10}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_2f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2c .. :try_end_2f} :catch_67
    .catch Ljava/security/InvalidKeyException; {:try_start_2c .. :try_end_2f} :catch_7c

    .line 66
    :try_start_2f
    invoke-virtual {v2, v13}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_32
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2f .. :try_end_32} :catch_6e
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2f .. :try_end_32} :catch_7e

    move-result-object v5

    .line 70
    .local v5, "encryptedBytes":[B
    array-length v14, v9

    array-length v15, v5

    add-int/2addr v14, v15

    new-array v3, v14, [B

    .line 71
    .local v3, "cipherText":[B
    const/4 v14, 0x0

    const/4 v15, 0x0

    array-length v0, v9

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v9, v14, v3, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    const/4 v14, 0x0

    array-length v15, v9

    array-length v0, v5

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-static {v5, v14, v3, v15, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 73
    const/4 v14, 0x2

    invoke-static {v3, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v1

    .line 75
    .local v1, "base64Bytes":[B
    :try_start_51
    new-instance v14, Ljava/lang/String;

    sget-object v15, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    invoke-direct {v14, v1, v15}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_58
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_51 .. :try_end_58} :catch_75

    return-object v14

    .line 45
    .end local v1    # "base64Bytes":[B
    .end local v2    # "cipher":Ljavax/crypto/Cipher;
    .end local v3    # "cipherText":[B
    .end local v5    # "encryptedBytes":[B
    .end local v9    # "iv":[B
    .end local v10    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .end local v11    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    .end local v12    # "sr":Ljava/security/SecureRandom;
    .end local v13    # "unencryptedBytes":[B
    :catch_59
    move-exception v4

    .line 46
    .local v4, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 51
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v13    # "unencryptedBytes":[B
    :catch_60
    move-exception v6

    .line 52
    .local v6, "f":Ljava/security/GeneralSecurityException;
    :goto_61
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 61
    .end local v6    # "f":Ljava/security/GeneralSecurityException;
    .restart local v2    # "cipher":Ljavax/crypto/Cipher;
    .restart local v9    # "iv":[B
    .restart local v10    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .restart local v11    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    .restart local v12    # "sr":Ljava/security/SecureRandom;
    :catch_67
    move-exception v7

    .line 62
    .local v7, "g":Ljava/security/GeneralSecurityException;
    :goto_68
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 67
    .end local v7    # "g":Ljava/security/GeneralSecurityException;
    :catch_6e
    move-exception v8

    .line 68
    .local v8, "h":Ljava/security/GeneralSecurityException;
    :goto_6f
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 76
    .end local v8    # "h":Ljava/security/GeneralSecurityException;
    .restart local v1    # "base64Bytes":[B
    .restart local v3    # "cipherText":[B
    .restart local v5    # "encryptedBytes":[B
    :catch_75
    move-exception v4

    .line 77
    .restart local v4    # "e":Ljava/io/UnsupportedEncodingException;
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 61
    .end local v1    # "base64Bytes":[B
    .end local v3    # "cipherText":[B
    .end local v4    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v5    # "encryptedBytes":[B
    :catch_7c
    move-exception v7

    goto :goto_68

    .line 67
    :catch_7e
    move-exception v8

    goto :goto_6f

    .line 51
    .end local v2    # "cipher":Ljavax/crypto/Cipher;
    .end local v9    # "iv":[B
    .end local v10    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .end local v11    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    .end local v12    # "sr":Ljava/security/SecureRandom;
    :catch_80
    move-exception v6

    goto :goto_61
.end method

.method public static unobfuscate(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/4 v14, 0x0

    .line 82
    invoke-static {}, Lnet/dirtybox/util/obfuscation/StringObfuscator;->initialize()V

    .line 85
    :try_start_4
    sget-object v12, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    invoke-virtual {p0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_9} :catch_44

    move-result-object v0

    .line 89
    .local v0, "base64Bytes":[B
    invoke-static {v0, v14}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v2

    .line 92
    .local v2, "cipherText":[B
    :try_start_e
    const-string v12, "AES/CTR/NoPadding"

    invoke-static {v12}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_13
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_e .. :try_end_13} :catch_4b
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_e .. :try_end_13} :catch_6b

    move-result-object v1

    .line 96
    .local v1, "cipher":Ljavax/crypto/Cipher;
    new-instance v10, Ljavax/crypto/spec/SecretKeySpec;

    sget-object v12, Lnet/dirtybox/util/obfuscation/StringObfuscator;->DECODED_KEY:[B

    const-string v13, "AES"

    invoke-direct {v10, v12, v13}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 97
    .local v10, "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/16 v12, 0x10

    new-array v8, v12, [B

    .line 98
    .local v8, "iv":[B
    array-length v12, v8

    invoke-static {v2, v14, v8, v14, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    new-instance v9, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v9, v8}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 100
    .local v9, "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    array-length v12, v2

    array-length v13, v8

    sub-int/2addr v12, v13

    new-array v4, v12, [B

    .line 101
    .local v4, "encryptedBytes":[B
    array-length v12, v8

    array-length v13, v4

    invoke-static {v2, v12, v4, v14, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 103
    const/4 v12, 0x2

    :try_start_35
    invoke-virtual {v1, v12, v10, v9}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_38
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_35 .. :try_end_38} :catch_52
    .catch Ljava/security/InvalidKeyException; {:try_start_35 .. :try_end_38} :catch_67

    .line 109
    :try_start_38
    invoke-virtual {v1, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_3b
    .catch Ljavax/crypto/BadPaddingException; {:try_start_38 .. :try_end_3b} :catch_59
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_38 .. :try_end_3b} :catch_69

    move-result-object v11

    .line 114
    .local v11, "unencryptedBytes":[B
    :try_start_3c
    new-instance v12, Ljava/lang/String;

    sget-object v13, Lnet/dirtybox/util/obfuscation/StringObfuscator;->OBFUSCATION_CHARSET:Ljava/lang/String;

    invoke-direct {v12, v11, v13}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_43
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3c .. :try_end_43} :catch_60

    return-object v12

    .line 86
    .end local v0    # "base64Bytes":[B
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "cipherText":[B
    .end local v4    # "encryptedBytes":[B
    .end local v8    # "iv":[B
    .end local v9    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .end local v10    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    .end local v11    # "unencryptedBytes":[B
    :catch_44
    move-exception v3

    .line 87
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 93
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "base64Bytes":[B
    .restart local v2    # "cipherText":[B
    :catch_4b
    move-exception v5

    .line 94
    .local v5, "f":Ljava/security/GeneralSecurityException;
    :goto_4c
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 104
    .end local v5    # "f":Ljava/security/GeneralSecurityException;
    .restart local v1    # "cipher":Ljavax/crypto/Cipher;
    .restart local v4    # "encryptedBytes":[B
    .restart local v8    # "iv":[B
    .restart local v9    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .restart local v10    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :catch_52
    move-exception v6

    .line 105
    .local v6, "g":Ljava/security/GeneralSecurityException;
    :goto_53
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 110
    .end local v6    # "g":Ljava/security/GeneralSecurityException;
    :catch_59
    move-exception v7

    .line 111
    .local v7, "h":Ljava/security/GeneralSecurityException;
    :goto_5a
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 115
    .end local v7    # "h":Ljava/security/GeneralSecurityException;
    .restart local v11    # "unencryptedBytes":[B
    :catch_60
    move-exception v3

    .line 116
    .restart local v3    # "e":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 104
    .end local v3    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v11    # "unencryptedBytes":[B
    :catch_67
    move-exception v6

    goto :goto_53

    .line 110
    :catch_69
    move-exception v7

    goto :goto_5a

    .line 93
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v4    # "encryptedBytes":[B
    .end local v8    # "iv":[B
    .end local v9    # "ivParamSpec":Ljavax/crypto/spec/IvParameterSpec;
    .end local v10    # "secKeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :catch_6b
    move-exception v5

    goto :goto_4c
.end method
