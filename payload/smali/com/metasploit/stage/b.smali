.class public final Lcom/metasploit/stage/b;
.super Ljava/lang/Object;


# static fields
.field private static final a:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/metasploit/stage/b;->a:J

    return-void
.end method

.method private static a([BI)I
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    add-int v2, v0, p1

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v3, v0, 0x3

    shl-int/2addr v2, v3

    or-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public static a([B)Lcom/metasploit/stage/a;
    .locals 11

    const/16 v10, 0x40

    const/4 v1, 0x0

    const/16 v2, 0x10

    new-instance v3, Lcom/metasploit/stage/a;

    invoke-direct {v3}, Lcom/metasploit/stage/a;-><init>()V

    invoke-static {p0, v1}, Lcom/metasploit/stage/b;->a([BI)I

    move-result v0

    iput v0, v3, Lcom/metasploit/stage/a;->a:I

    sget-wide v4, Lcom/metasploit/stage/b;->a:J

    const/16 v0, 0xc

    invoke-static {p0, v0}, Lcom/metasploit/stage/b;->a([BI)I

    move-result v0

    int-to-long v6, v0

    mul-long/2addr v4, v6

    iput-wide v4, v3, Lcom/metasploit/stage/a;->b:J

    invoke-static {p0, v2, v2}, Lcom/metasploit/stage/b;->b([BII)[B

    const/16 v0, 0x20

    invoke-static {p0, v0, v2}, Lcom/metasploit/stage/b;->b([BII)[B

    const/16 v0, 0x30

    iget v2, v3, Lcom/metasploit/stage/a;->a:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_0

    const/16 v2, 0x1f40

    const/16 v4, 0x64

    invoke-static {p0, v2, v4}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lcom/metasploit/stage/a;->c:Ljava/lang/String;

    :cond_0
    :goto_0
    aget-byte v2, p0, v0

    if-eqz v2, :cond_5

    new-instance v4, Lcom/metasploit/stage/g;

    invoke-direct {v4}, Lcom/metasploit/stage/g;-><init>()V

    const/16 v2, 0x200

    invoke-static {p0, v0, v2}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/metasploit/stage/g;->a:Ljava/lang/String;

    add-int/lit16 v0, v0, 0x200

    add-int/lit8 v0, v0, 0x4

    sget-wide v6, Lcom/metasploit/stage/b;->a:J

    invoke-static {p0, v0}, Lcom/metasploit/stage/b;->a([BI)I

    move-result v2

    int-to-long v8, v2

    mul-long/2addr v6, v8

    iput-wide v6, v4, Lcom/metasploit/stage/g;->b:J

    add-int/lit8 v0, v0, 0x4

    sget-wide v6, Lcom/metasploit/stage/b;->a:J

    invoke-static {p0, v0}, Lcom/metasploit/stage/b;->a([BI)I

    move-result v2

    int-to-long v8, v2

    mul-long/2addr v6, v8

    iput-wide v6, v4, Lcom/metasploit/stage/g;->c:J

    add-int/lit8 v0, v0, 0x4

    iget-object v2, v4, Lcom/metasploit/stage/g;->a:Ljava/lang/String;

    const-string v5, "http"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/16 v2, 0x80

    invoke-static {p0, v0, v2}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    add-int/lit16 v0, v0, 0x80

    invoke-static {p0, v0, v10}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    add-int/lit8 v0, v0, 0x40

    invoke-static {p0, v0, v10}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    add-int/lit8 v0, v0, 0x40

    const/16 v2, 0x100

    invoke-static {p0, v0, v2}, Lcom/metasploit/stage/b;->a([BII)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/metasploit/stage/g;->d:Ljava/lang/String;

    add-int/lit16 v0, v0, 0x100

    const/4 v2, 0x0

    iput-object v2, v4, Lcom/metasploit/stage/g;->e:[B

    const/16 v2, 0x14

    invoke-static {p0, v0, v2}, Lcom/metasploit/stage/b;->b([BII)[B

    move-result-object v5

    add-int/lit8 v2, v0, 0x14

    move v0, v1

    :goto_1
    array-length v6, v5

    if-ge v0, v6, :cond_1

    aget-byte v6, v5, v0

    if-eqz v6, :cond_2

    iput-object v5, v4, Lcom/metasploit/stage/g;->e:[B

    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    array-length v6, p0

    move v0, v2

    :goto_2
    if-ge v0, v6, :cond_3

    aget-byte v7, p0, v0

    if-eqz v7, :cond_3

    and-int/lit16 v7, v7, 0xff

    int-to-char v7, v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/metasploit/stage/g;->f:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v2

    :cond_4
    iget-object v2, v3, Lcom/metasploit/stage/a;->d:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_5
    return-object v3
.end method

.method private static a([BII)Ljava/lang/String;
    .locals 3

    invoke-static {p0, p1, p2}, Lcom/metasploit/stage/b;->b([BII)[B

    move-result-object v0

    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "ISO-8859-1"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static b([BII)[B
    .locals 2

    new-array v0, p2, [B

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method
