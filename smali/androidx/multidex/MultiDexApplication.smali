.class public Landroidx/multidex/MultiDexApplication;
.super Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x15

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method


# virtual methods
.method protected native attachBaseContext(Landroid/content/Context;)V
.end method
