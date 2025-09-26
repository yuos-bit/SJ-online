.class public Lobfuse/NPStringFog;
.super Ljava/lang/Object;
.source "NPStringFog.java"


# static fields
.field public static KEY:Ljava/lang/String; = null

.field private static final hexString:Ljava/lang/String; = "0123456789ABCDEF"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 18
    const-string v0, "npmanager"

    sput-object v0, Lobfuse/NPStringFog;->KEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;

    .line 72
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 73
    .line 75
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 76
    const-string v3, "0123456789ABCDEF"

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    shl-int/lit8 v3, v3, 0x4

    const-string v4, "0123456789ABCDEF"

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    or-int/2addr v3, v4

    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 75
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 77
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 78
    .local v2, "b":[B
    array-length v3, v2

    .line 79
    .local v3, "len":I
    sget-object v4, Lobfuse/NPStringFog;->KEY:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    .line 80
    .local v4, "keyLen":I
    nop

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_1

    .line 81
    aget-byte v5, v2, v1

    sget-object v6, Lobfuse/NPStringFog;->KEY:Ljava/lang/String;

    rem-int v7, v1, v4

    invoke-virtual {v6, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    xor-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v1

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 83
    .end local v1    # "i":I
    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method
