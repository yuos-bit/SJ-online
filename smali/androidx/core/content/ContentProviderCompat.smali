.class public final Landroidx/core/content/ContentProviderCompat;
.super Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static requireContext(Landroid/content/ContentProvider;)Landroid/content/Context;
    .locals 1

    .line 45
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    .line 47
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "2D11030F011547031B00144D02010F13000A1A500B13010C47111A0B501D1301170E01171C5E"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
