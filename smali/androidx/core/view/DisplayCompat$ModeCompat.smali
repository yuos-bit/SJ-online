.class public final Landroidx/core/view/DisplayCompat$ModeCompat;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/DisplayCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field private final mIsNative:Z

.field private final mMode:Landroid/view/Display$Mode;

.field private final mPhysicalDisplaySize:Landroid/graphics/Point;


# direct methods
.method constructor <init>(Landroid/graphics/Point;)V
    .locals 1

    .line 258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "1E181412070206093607031D0D0F18340C080B50505C4E0F12091E"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 259
    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    .line 260
    iput-boolean v0, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mIsNative:Z

    .line 261
    iput-object p1, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mPhysicalDisplaySize:Landroid/graphics/Point;

    const/4 p1, 0x0

    .line 262
    iput-object p1, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mMode:Landroid/view/Display$Mode;

    return-void
.end method

.method constructor <init>(Landroid/view/Display$Mode;Z)V
    .locals 2

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "2A191E1102001E4B3F01140841535C470B07021C41410D000942064E071F001E4106451C1B1C01411C040100000B1E0E04"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 273
    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    iput-boolean p2, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mIsNative:Z

    .line 276
    new-instance p2, Landroid/graphics/Point;

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v1

    invoke-direct {p2, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    iput-object p2, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mPhysicalDisplaySize:Landroid/graphics/Point;

    .line 277
    iput-object p1, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mMode:Landroid/view/Display$Mode;

    return-void
.end method


# virtual methods
.method public getPhysicalHeight()I
    .locals 1

    .line 295
    iget-object v0, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mPhysicalDisplaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    return v0
.end method

.method public getPhysicalWidth()I
    .locals 1

    .line 286
    iget-object v0, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mPhysicalDisplaySize:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    return v0
.end method

.method public isNative()Z
    .locals 1

    .line 317
    iget-boolean v0, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mIsNative:Z

    return v0
.end method

.method public toMode()Landroid/view/Display$Mode;
    .locals 1

    .line 307
    iget-object v0, p0, Landroidx/core/view/DisplayCompat$ModeCompat;->mMode:Landroid/view/Display$Mode;

    return-object v0
.end method
