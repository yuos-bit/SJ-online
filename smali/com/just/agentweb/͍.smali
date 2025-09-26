.class public Lcom/just/agentweb/͍;
.super Ljava/lang/Object;


# static fields
.field public static final ̅:Ljava/lang/String; = "Camera"

.field public static final ̍:Ljava/lang/String; = "Location"

.field public static final ̎:Ljava/lang/String; = "Storage"

.field public static final ̐:[Ljava/lang/String;

.field public static final ̒:[Ljava/lang/String;

.field public static final ̓:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "0F1E09130108034B020B0200081D120E0A1C40332C2C2B3326"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/͍;->̐:[Ljava/lang/String;

    const-string v0, "0F1E09130108034B020B0200081D120E0A1C40312E222B32343A34273E283E222E242426273F23"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/͍;->̒:[Ljava/lang/String;

    const-string v0, "0F1E09130108034B020B0200081D120E0A1C402228202A3E223D262B222320223E34313D3C312A24"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/just/agentweb/͍;->̓:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
