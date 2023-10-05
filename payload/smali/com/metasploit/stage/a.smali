.class public final Lcom/metasploit/stage/a;
.super Ljava/lang/Object;


# instance fields
.field public a:I

.field public b:J

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/metasploit/stage/a;->d:Ljava/util/List;

    return-void
.end method

.method public static a(Ljava/net/URLConnection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v1, 0x0

    invoke-static {p2}, Lcom/metasploit/stage/a;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "User-Agent"

    invoke-virtual {p0, v0, p2}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v0, "\r\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    move v0, v1

    :goto_0
    if-ge v0, v3, :cond_2

    aget-object v4, v2, v0

    invoke-static {v4}, Lcom/metasploit/stage/a;->a(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, ": "

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    if-ne v5, v7, :cond_1

    aget-object v5, v4, v1

    invoke-static {v5}, Lcom/metasploit/stage/a;->a(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    aget-object v5, v4, v6

    invoke-static {v5}, Lcom/metasploit/stage/a;->a(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    aget-object v5, v4, v1

    aget-object v4, v4, v6

    invoke-virtual {p0, v5, v4}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private static a(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
