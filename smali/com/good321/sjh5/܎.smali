.class public Lcom/good321/sjh5/܎;
.super Landroidx/appcompat/app/AppCompatActivity;


# instance fields
.field private ̅:Ljava/lang/String;

.field private ̍:Landroidx/recyclerview/widget/RecyclerView;

.field private ̎:Landroidx/fragment/app/Fragment;

.field private ̐:I

.field private ̒:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private ̓:Landroidx/fragment/app/FragmentManager;

.field private ̔:Landroidx/fragment/app/FragmentTransaction;

.field private ̕:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x13

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const-string v0, "2311040F2F02130C04070414"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/good321/sjh5/܎;->̅:Ljava/lang/String;

    iput-object v1, p0, Lcom/good321/sjh5/܎;->̓:Landroidx/fragment/app/FragmentManager;

    iput-object v1, p0, Lcom/good321/sjh5/܎;->̔:Landroidx/fragment/app/FragmentTransaction;

    return-void
.end method

.method static synthetic ̍(Lcom/good321/sjh5/܎;I)V
    .locals 4

    const-string v0, "B5E7B6F9B5CDBCC0A9F5ABF1BAF6BAF1BED0B5DBB6FEB5CDBCCDA9F6ABCDBACABAF1BEEAB5D7B6F8B5F9BCFD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x2af

    const v3, 0x4b6e2a02    # 1.5608322E7f

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D6B6C6B5C6BCC0A9CFABCDBAF4BAC0BED7B5E8B6CAB5C1BCCEA9CAABCFBAF6BAFF"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D2B6C7B5C5BCFCA9F8ABCABAF6BACBBEEEB5D7B6C1B5C7BCC7A9C6ABCCBACE"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    invoke-direct {p0, p1}, Lcom/good321/sjh5/܎;->̎(I)V

    const-string v0, "B5EFB6F8B5C7BCFDA9CAABC8BAF2BAFCBED4B5DCB6C7B5F8BCC3A9F6ABCFBAF2BAC0BEE5B5D0B6F8B5C5BCC9A9C8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    return-void

    :sswitch_data_0
    .sparse-switch
        -0xae60e77 -> :sswitch_3
        0xead82b9 -> :sswitch_2
        0x4e3374bb -> :sswitch_1
        0x6d15825a -> :sswitch_0
    .end sparse-switch
.end method

.method private native ̎(I)V
.end method

.method private native ̐()V
.end method


# virtual methods
.method protected native onCreate(Landroid/os/Bundle;)V
.end method

.method public native onKeyDown(ILandroid/view/KeyEvent;)Z
.end method

.method protected native onPause()V
.end method

.method protected native onResume()V
.end method
