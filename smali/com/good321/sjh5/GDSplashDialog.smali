.class public Lcom/good321/sjh5/GDSplashDialog;
.super Ljava/lang/Object;


# static fields
.field private static ̅:Ljava/lang/String; = "GDSplashDialog"

.field private static ̍:Landroid/app/Dialog; = null

.field public static ̎:Z = false

.field public static ̐:Z = false

.field private static ̒:J = 0x0L

.field private static ̓:J = 0x3e8L


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x2

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    const-string v0, "B5D8B6C4B5C6BCC1A9C5ABF5BAF6BAFDBEDEB5D1B6C1B5C1BCC4A9C5ABFBBAF8BAFFBED9B5E6B6F7B5CABCC1A9F5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x103

    const v3, -0x41e15a

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    return-void

    :pswitch_data_0
    .packed-switch 0xb15ea42
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native ̎()V
.end method

.method public static native ̐(Landroid/app/Activity;Lcom/good321/sjh5/̓;)V
.end method

.method static synthetic ̒(J)J
    .locals 4

    const-string v0, "B5D6B6CDB5C4BCFDA9F7ABF4BACCBAC3BEDAB5D5B6F9B5C5BCF3A9C8ABF2BACCBAC2"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x74

    const v3, -0x1238e968

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5DCB6F9B5F7BCFDA9F2ABF1BACBBAFFBEEEB5EFB6C3B5C6BCC5A9F1ABF2BAF5BAC7BEEAB5D4B6FE"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    sput-wide p0, Lcom/good321/sjh5/GDSplashDialog;->̒:J

    const-string v0, "B5E7B6FDB5C4BCFDA9F6ABC5BAF8BAFFBEE5B5E8B6C3B5C3BCC2A9CFABC5BAF1BAFFBEEAB5EAB6C6B5C5BCC4A9F2ABC6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    return-wide p0

    :sswitch_data_0
    .sparse-switch
        -0x6f5c421e -> :sswitch_0
        -0x238381c5 -> :sswitch_1
        0x1bbf7ab9 -> :sswitch_2
    .end sparse-switch
.end method

.method static synthetic ̓()Landroid/app/Dialog;
    .locals 4

    const-string v0, "B5D5B6C3B5C5BCF3A9F7ABCBBACCBAFEBEEBB5D1B6F6B5F8BCC5A9CCABC8BACCBAF8BEDAB5E8B6C4B5C1BCC3A9F6ABC1BAC6BAC1"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x3b9

    const v3, -0x4645e4f9

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v0, Lcom/good321/sjh5/GDSplashDialog;->̍:Landroid/app/Dialog;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x2a21cb54
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic ̔(Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 4

    const-string v0, "B5D6B6C4B5FBBCCEA9CEABF7BAF1BAFDBEE4B5E8B6C6B5FABCC0A9F6ABC5BAC9BAFBBEE5B5DBB6C9B5CDBCC1A9C8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x2d8

    const v3, -0x3341270d    # -1.0005903E8f

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5DBB6F8B5FEBCC2A9CAABFABAC5BAC1BED3B5E9B6C7B5C1BCFAA9CCABCABAC9BAC2BEEAB5EFB6C7B5FA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    sput-object p0, Lcom/good321/sjh5/GDSplashDialog;->̍:Landroid/app/Dialog;

    const-string v0, "B5D1B6F6B5C7BCFDA9CFABF7BAC5BAC5BED4B5E8B6F9B5F7BCC7A9F5ABF1BAF2BAF8BEE5B5DCB6CDB5C5BCFDA9F6ABC6BAF8BAC0"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x2ad60f02 -> :sswitch_0
        0x552480fa -> :sswitch_2
        0x7ef80243 -> :sswitch_1
    .end sparse-switch
.end method

.method public static native ̕()V
.end method

.method private static native ̖()V
.end method
