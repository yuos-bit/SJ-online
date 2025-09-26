.class public Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter",
        "<",
        "Lcom/good321/sjh5/adapter/\u0780;",
        ">;"
    }
.end annotation


# instance fields
.field private ̅:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/good321/sjh5/adapter/\u0334;",
            ">;"
        }
    .end annotation
.end field

.field private ̍:Lcom/good321/sjh5/adapter/̵;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    invoke-static {v0}, Lnp/manager/Protect;->classesInit0(I)V

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/good321/sjh5/adapter/\u0334;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public native getItemCount()I
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4

    const-string v0, "B5D6B6C9B5C4BCFDA9F6ABF5BAF9BACBBEE4B5ECB6F7B5C4BCFAA9F4ABCBBAF1BAC7BED9B5EFB6FBB5FDBCC3A9F6ABCFBAC2BAC6BEEA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x2c9

    const v3, -0x465cdf57

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5E6B6FEB5C4BCFCA9F7ABC6BAF4BACCBEDEB5D5B6FEB5FEBCCEA9F1ABCFBACFBACBBED7B5E7B6F7B5FDBCF3A9C6ABF5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D0B6FAB5C6BCFEA9F8ABFABACFBAF8BED4B5EAB6F8B5F8BCFCA9CAABCABAC2BAFEBEE5B5ECB6FAB5C6BCF2A9CEABF2BAC6BAC6BEE8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5D7B6F8B5F7BCFDA9F2ABC8BAC9BAC7BED7B5E8B6F9B5C6BCC9A9F4ABC5BAF4BAFFBEE4B5E9B6C9B5FEBCCDA9F2ABF5BACEBAC0BED5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    move-object v0, p1

    check-cast v0, Lcom/good321/sjh5/adapter/ހ;

    invoke-virtual {p0, v0, p2}, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->onBindViewHolder(Lcom/good321/sjh5/adapter/ހ;I)V

    const-string v0, "B5D7B6C6B5C6BCFFA9CCABF2BACABAC7BEEAB5E8B6C1B5CABCFFA9CEABC6BAF5BAFDBED2"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x56791652 -> :sswitch_1
        -0x409fcbcd -> :sswitch_4
        -0x1be6a1aa -> :sswitch_3
        -0x1eb666a -> :sswitch_0
        0x672df5e3 -> :sswitch_2
    .end sparse-switch
.end method

.method public native onBindViewHolder(Lcom/good321/sjh5/adapter/ހ;I)V
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 4

    const-string v0, "B5D0B6FEB5F7BCC3A9F2ABC1BACEBAC6BEDAB5E8B6FAB5F8BCF2A9CFABC6BACBBAFDBEDA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x3df

    const v3, 0x36d3305e

    xor-int/2addr v1, v2

    xor-int/2addr v1, v3

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D7B6FAB5F9BCCDA9C8ABCFBAF9BACFBEDAB5E8B6C0B5CDBCC1A9CAABF7BACF"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D0B6FAB5F7BCFDA9C5ABF1BAC6BACBBEE4B5D8B6F9B5FBBCFEA9F1ABF6BACBBAFF"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5D2B6F8B5C1BCC4A9C8ABCFBAC8BAF1BEEAB5D8B6C0B5C7BCFDA9CAABC6BACABAC7BEDEB5D8B6F8B5FABCCDA9F8ABF4"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p0, p1, p2}, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/good321/sjh5/adapter/ހ;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x12409a81 -> :sswitch_0
        0x260b2925 -> :sswitch_2
        0x2cbed4ea -> :sswitch_3
        0x7e0ad472 -> :sswitch_1
    .end sparse-switch
.end method

.method public native onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/good321/sjh5/adapter/ހ;
.end method

.method public native setOnItemClickListener(Lcom/good321/sjh5/adapter/̵;)V
.end method

.method public synthetic ̎(Lcom/good321/sjh5/adapter/ހ;Landroid/view/View;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v1, 0x0

    const-string v0, "B5D1B6C0B5C3BCFDA9F9ABF5BAF7BAC2BEEEB5E8B6FEB5C3BCFAA9F8ABCABACCBAF1BEEEB5D2B6C4B5CDBCC3A9F6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v1

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v4, 0x18b

    const v5, 0xb26566e

    xor-int/2addr v1, v4

    xor-int/2addr v1, v5

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D5B6C1B5F7BCFEA9C8ABCBBAF6BAF0BEE5B5E8B6F9B5C5BCFDA9F6ABF5BAC6BAFFBEDAB5D5B6F6B5C1BCCDA9C9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5EAB6CAB5C4BCC2A9C2ABCABACCBAC6BED7B5E8B6FEB5C4BCF3A9CCABF7BAC2BAC5BEE8B5D4B6C9B5CABCC7A9CEABC9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5DCB6C9B5C1BCC1A9F7ABCBBAC6BAFDBEE4B5DCB6FEB5F7BCFDA9C6ABC1BAF2BAFDBEEBB5E9B6C7B5CABCC4A9F6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/good321/sjh5/adapter/ހ;->getAdapterPosition()I

    move-result v1

    const-string v0, "B5E8B6F9B5FABCCEA9F1ABF1BAF6BAC6BEDEB5ECB6C3B5CDBCFFA9CCABCFBACFBAFEBED0B5D6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move v3, v1

    goto :goto_0

    :sswitch_4
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/good321/sjh5/adapter/̴;

    iget-object v1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/good321/sjh5/adapter/̴;

    iget-boolean v1, v1, Lcom/good321/sjh5/adapter/̴;->̅:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, v0, Lcom/good321/sjh5/adapter/̴;->̅:Z

    const-string v0, "B5E7B6C6B5CDBCC1A9CCABCDBAC9BAC1BEEEB5E8B6C0B5F6BCFDA9CEABCFBACFBAC2BEDEB5E7"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_5
    iget-object v1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̍:Lcom/good321/sjh5/adapter/̵;

    const-string v0, "B5D8B6CDB5F6BCC7A9C8ABC5BAF6BAC5BED4B5D8B6F9B5FDBCC2A9F8ABF5BAF7BAFBBEEEB5DCB6C1B5F8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v1

    goto :goto_0

    :sswitch_6
    const v1, -0x60bbf4a8

    const-string v0, "B5E9B6C0B5FABCC3A9C2ABFBBAF6BAF8BED0B5EAB6FBB5FDBCF9A9F6ABCABAC5BAFFBEEDB5EBB6FDB5F9BCFAA9C9ABF1BAF6BAC7BEEDB5EAB6FDB5F7BCF3"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v4

    xor-int/2addr v4, v1

    sparse-switch v4, :sswitch_data_1

    goto :goto_1

    :sswitch_7
    const-string v0, "B5D2B6FDB5FEBCC2A9CFABCABAF2BAFCBED7B5E8B6C1B5CDBCC0A9F6ABCABAC5BACCBED4B5E6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "B5EAB6CDB5C4BCFDA9F5ABF2BAC5BAFDBED9B5E8B6F9B5C6BCC4A9CBABC8BAC5BAC2BED4B5DCB6FEB5F6BCCDA9CFABF5BACFBAF1BEDA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_8
    if-eqz v2, :cond_0

    const-string v0, "B5DBB6F6B5CDBCCEA9CAABCDBAC2BAFBBED6B5D8B6C3B5C7BCC3"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_9
    const-string v0, "B5EAB6F9B5F7BCFFA9C9ABF6BAC6BAC2BEDAB5E8B6CAB5C3BCC2A9F2ABF2BAC9BAC3BED7B5E6B6F7B5F6BCFDA9F4ABFABAF2BAFFBEDEB5EFB6C7"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_a
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/good321/sjh5/adapter/̴;

    invoke-interface {v2, p2, v0}, Lcom/good321/sjh5/adapter/̵;->̍(Landroid/view/View;Lcom/good321/sjh5/adapter/̴;)V

    const-string v0, "B5D6B6C9B5C6BCFDA9F9ABCBBACBBAFFBEE8B5E7B6FEB5FABCFCA9F8ABC5BAF1BAC7BEE8B5D6B6F8B5FABCC4A9C2ABF6BAF8BAFFBEDEB5DBB6CD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "B5D6B6C9B5C6BCFDA9F9ABCBBACBBAFFBEE8B5E7B6FEB5FABCFCA9F8ABC5BAF1BAC7BEE8B5D6B6F8B5FABCC4A9C2ABF6BAF8BAFFBEDEB5DBB6CD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_c
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x6f8e9ec2 -> :sswitch_2
        -0x6e44feef -> :sswitch_6
        -0x6b57833d -> :sswitch_4
        -0x615c1869 -> :sswitch_5
        -0x60f7bac5 -> :sswitch_a
        -0x39eda911 -> :sswitch_3
        0xa2cc104 -> :sswitch_1
        0x19f60da2 -> :sswitch_c
        0x3711b3e4 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x70556c51 -> :sswitch_8
        -0x310b49e1 -> :sswitch_9
        0xde0d441 -> :sswitch_b
        0x5021f6f9 -> :sswitch_7
    .end sparse-switch
.end method

.method public synthetic ̐(Lcom/good321/sjh5/adapter/ހ;Landroid/view/View;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v1, 0x0

    const-string v0, "B5E6B6C3B5FDBCFDA9CBABC9BAF5BAFBBED3B5DCB6C9B5C9BCC9A9F7ABC9BACABAC2BED5B5D4B6C0B5F6BCFCA9F9ABCABAF6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v4, 0x2eb

    const v5, 0x8fed13b

    xor-int/2addr v3, v4

    xor-int/2addr v3, v5

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D2B6C9B5C7BCC2A9C2ABCCBAF6BAC6BEEAB5D5B6F6B5C1BCC9A9CCABF6BAF5BAC2BED5B5E8B6F9B5FEBCFCA9F5ABF6BACABAC1BED3B5E7B6C6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5E6B6F6B5C0BCC2A9CCABF6BAF7BAC7BEDAB5E8B6C4B5C3BCC4A9F6ABF2BAF2BACC"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5D5B6FEB5F7BCFAA9F1ABC6BAC2BAC2BEDEB5EAB6CDB5F7BCFDA9C6ABF6BACCBAC5BEDAB5E9B6C3B5CDBCC4A9F6ABF1BAF1BAFE"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/good321/sjh5/adapter/ހ;->getAdapterPosition()I

    move-result v2

    const-string v0, "B5ECB6F8B5CDBCF2A9F8ABCCBAF6BACBBED4B5D7B6F9B5C4BCFDA9F4ABC8BAF4BAC2BEEA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    iget-object v1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̍:Lcom/good321/sjh5/adapter/̵;

    const-string v0, "B5D6B6C4B5F9BCFDA9C6ABC1BACBBAFFBED7B5EFB6C7B5C0BCC5A9C5ABC1BAC6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_5
    const v3, 0x2a1ef54a

    const-string v0, "B5E9B6FAB5C3BCFFA9F9ABCFBAF1BACCBEEEB5E8B6C0B5C0BCC5A9F7ABF5BACEBAC6BEEAB5D4B6C0B5C9BCC2A9F4ABC9BAF7BAFBBED5B5E8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v4

    xor-int/2addr v4, v3

    sparse-switch v4, :sswitch_data_1

    goto :goto_1

    :sswitch_6
    if-eqz v1, :cond_0

    const-string v0, "B5DCB6C5B5FDBCFDA9C5ABCCBACCBACCBED0B5ECB6F8B5FABCF9A9F7ABFBBACFBAFFBEDEB5D0B6FEB5C4BCF2A9F8ABF5BAC5BACBBED9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_0
    const-string v0, "B5D2B6FDB5C4BCC3A9CEABFABAF2BAFCBED4B5D2B6C0B5C0BCFDA9CBABCDBAF8BAFCBEDAB5E6B6F9B5C6BCC9A9F5ABC8BAF1BAFD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_7
    const-string v0, "B5D2B6F8B5FDBCFDA9F9ABC6BACABAC6BED4B5D1B6C3B5CDBCFDA9C6ABFBBACFBAFBBED2B5E7"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_8
    const-string v0, "B5EAB6C0B5CDBCC3A9F2ABCCBAF6BACBBEE9B5E8B6C5B5CDBCC4A9F6ABFABAC2BAC7BED7B5D0B6C7B5F9BCC1A9CBABF5BACFBAC3BED0"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_9
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/good321/sjh5/adapter/̴;

    const-string v3, "0F1409"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/good321/sjh5/adapter/ހ;->̍:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, p2, v0, v3, v4}, Lcom/good321/sjh5/adapter/̵;->̍(Landroid/view/View;Lcom/good321/sjh5/adapter/̴;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "B5EAB6C1B5C5BCC7A9C9ABF5BAF6BACBBEE5B5ECB6C7B5C1BCFDA9C5ABCFBAC8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "B5EAB6C1B5C5BCC7A9C9ABF5BAF6BACBBEE5B5ECB6C7B5C1BCFDA9C5ABCFBAC8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_b
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x669ac94d -> :sswitch_2
        -0x54e432e6 -> :sswitch_9
        -0x4b27de77 -> :sswitch_3
        -0x1565ad1 -> :sswitch_4
        0xe54478f -> :sswitch_b
        0x208e4112 -> :sswitch_1
        0x34b239e2 -> :sswitch_5
        0x61895cb7 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x5721ae7b -> :sswitch_8
        0x2db52415 -> :sswitch_6
        0x511101c6 -> :sswitch_7
        0x59e33543 -> :sswitch_a
    .end sparse-switch
.end method

.method public synthetic ̒(Lcom/good321/sjh5/adapter/ހ;Landroid/view/View;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v1, 0x0

    const-string v0, "B5EFB6C1B5FDBCC2A9F7ABF1BAF7BAC7BEEAB5E8B6F6B5FEBCCDA9F9ABCFBAC2BAC6BED2B5D0B6C5B5F8BCFEA9F1ABFBBAF4BAC2BEEEB5D1B6F9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v4, 0xd5

    const v5, -0x345a2832    # -2.1737372E7f

    xor-int/2addr v3, v4

    xor-int/2addr v3, v5

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5D4B6FEB5C0BCF2A9F5ABC9BACEBAF0BED7B5D8B6C0B5C4BCCEA9C5ABCF"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5ECB6C7B5FEBCC0A9CAABCABACBBAFFBED3B5E8B6F9B5C7BCC7A9CEABC9BACEBAFEBEDA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5D8B6FBB5C0BCC1A9F4ABCBBACABAF1BED9B5EAB6FDB5F7BCFDA9C8ABFBBAF6BACFBED9B5EBB6F9B5CABCFDA9F6ABCDBAF1BAC7BED2B5E9B6FA"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/good321/sjh5/adapter/ހ;->getAdapterPosition()I

    move-result v2

    const-string v0, "B5E7B6C9B5FBBCC0A9C8ABF5BAF9BAC0BEEBB5D1B6F7B5CABCF2A9C2ABFBBAF6BAFBBED3B5D6B6F9B5C4BCC0A9F2ABF5BAF2BACFBED3B5E9B6F9B5FDBCFD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    iget-object v1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̍:Lcom/good321/sjh5/adapter/̵;

    const-string v0, "B5E7B6F9B5FDBCFDA9CEABCABAC8BAFFBEE8B5E7B6C7B5C5BCC4A9F6ABFABAC6BAFC"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_5
    const v3, -0x759471b6    # -1.13416E-32f

    const-string v0, "B5D5B6CDB5C1BCC5A9CAABC6BAF2BAFCBED3B5E8B6FAB5F7BCC4A9CCABCCBAC5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v4

    xor-int/2addr v4, v3

    sparse-switch v4, :sswitch_data_1

    goto :goto_1

    :sswitch_6
    if-eqz v1, :cond_0

    const-string v0, "B5ECB6F7B5C1BCC0A9F9ABCBBACCBAC1BED7B5D0B6FDB5C6BCC3A9F9ABC1BACCBAFDBED7B5E8B6FEB5FABCC5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_0
    const-string v0, "B5EAB6C1B5CABCCEA9CCABF2BAC6BAC3BEDAB5EAB6C9B5CABCC2A9CEABC9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_7
    const-string v0, "B5D1B6CAB5C4BCF9A9C6ABFABAF5BAC2BED4B5D5B6F6B5CDBCF3A9F8ABF5BAC9BAFBBEEAB5EBB6CDB5C4BCFD"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_8
    const-string v0, "B5D0B6C7B5C4BCC3A9F2ABC5BAF8BAC3BEE9B5E9B6C0B5C1BCC9A9C2ABFBBAF6BAFCBEDAB5D5B6F9"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_9
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/good321/sjh5/adapter/̴;

    const-string v3, "1C15000E1804"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/good321/sjh5/adapter/ހ;->̍:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, p2, v0, v3, v4}, Lcom/good321/sjh5/adapter/̵;->̍(Landroid/view/View;Lcom/good321/sjh5/adapter/̴;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "B5D7B6F6B5C4BCFDA9C8ABCABAF5BAC7BEE8B5ECB6C4B5C0BCC3A9F6ABF5BACCBAF1BED4B5D5B6FAB5F6BCF3A9C6ABF5BAC5BAF0BEE8B5EAB6C3B5FE"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "B5D7B6F6B5C4BCFDA9C8ABCABAF5BAC7BEE8B5ECB6C4B5C0BCC3A9F6ABF5BACCBAF1BED4B5D5B6FAB5F6BCF3A9C6ABF5BAC5BAF0BEE8B5EAB6C3B5FE"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_b
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x3c9925b1 -> :sswitch_2
        -0x35ceec10 -> :sswitch_4
        -0x3000d046 -> :sswitch_b
        -0xc61e86f -> :sswitch_1
        -0x16102d2 -> :sswitch_0
        0x2c7a5bf9 -> :sswitch_5
        0x2e5e70db -> :sswitch_3
        0x6899a79b -> :sswitch_9
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x4a8b5523 -> :sswitch_a
        0x2a75a320 -> :sswitch_6
        0x3385103c -> :sswitch_7
        0x543881d7 -> :sswitch_8
    .end sparse-switch
.end method

.method public synthetic ̓(Lcom/good321/sjh5/adapter/ހ;Landroid/view/View;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v1, 0x0

    const-string v0, "B5E9B6C4B5FABCF2A9F9ABC9BAC2BACCBEE9B5DCB6CAB5C1BCC3A9F7ABCDBACABAF0BED7B5E8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/16 v4, 0xaa

    const v5, 0x2962488d

    xor-int/2addr v3, v4

    xor-int/2addr v3, v5

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "B5EBB6F6B5C5BCF2A9F1ABCCBAF6BAC1BEDEB5D1B6F9B5C1BCC7A9F8ABC1BACEBAC6BEEAB5D1B6C9B5C6BCC5A9C8ABC6BACBBAC7BED3B5E8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_1
    const-string v0, "B5D2B6F8B5F9BCFDA9CAABFBBAF5BAF1BED3B5E8B6F9B5F9BCC2A9CBABF5BAF2BAC5BEEAB5E8"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_2
    const-string v0, "B5E7B6F7B5F7BCFDA9F7ABC6BAC8BAFFBEEEB5D5B6C7B5F9BCC9A9F7ABC1BAF2BAC1BED5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/good321/sjh5/adapter/ހ;->getAdapterPosition()I

    move-result v2

    const-string v0, "B5D6B6C3B5F9BCFDA9F6ABFBBAC6BAFCBED9B5EFB6F9B5CABCF9A9F6ABC1BAF1BAC6BEEBB5D7B6C9B5F9BCFFA9F6ABCB"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_4
    iget-object v1, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̍:Lcom/good321/sjh5/adapter/̵;

    const-string v0, "B5D5B6F6B5F8BCF9A9CEABCCBAF6BAFEBEEEB5D2B6CDB5CDBCC4A9C6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_5
    const v3, -0x30cc2508    # -3.017472E9f

    const-string v0, "B5D1B6C0B5FDBCFDA9CEABF7BAF1BAC7BEEEB5E6B6F9B5C9BCC0A9F2ABF5BAF8BAF0BEE4"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v4

    xor-int/2addr v4, v3

    sparse-switch v4, :sswitch_data_1

    goto :goto_1

    :sswitch_6
    const-string v0, "B5D2B6C3B5FDBCFDA9C9ABC1BAC6BAC3BED4B5D1B6C0B5F8BCFCA9F9ABC6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "B5D7B6CAB5F6BCFEA9C5ABF2BAF9BAC1BED4B5E8B6C3B5C7BCFDA9C8ABCBBACEBAC5BEE9B5D5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_7
    if-eqz v1, :cond_0

    const-string v0, "B5EFB6CAB5C7BCF2A9C9ABC9BAF5BACBBEDAB5E8B6F9B5C5BCC0A9CBABCABAF6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_8
    const-string v0, "B5D7B6CAB5C9BCFDA9CEABC1BAF7BAC0BEDEB5D1B6F9B5CABCFAA9F6ABF4BAC6BAC5"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :sswitch_9
    const-string v0, "B5DCB6CAB5C7BCCEA9F1ABF4BAF9BAC5BEEAB5E8B6F8B5C3BCC0A9F6ABC6BAC2BAC1BEEBB5E8B6C9B5C0BCC0A9F6ABF7BAC8BACC"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :sswitch_a
    iget-object v0, p0, Lcom/good321/sjh5/adapter/GameFunctionButtonsAdapter;->̅:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/good321/sjh5/adapter/̴;

    const-string v3, "1D15010D"

    invoke-static {v3}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/good321/sjh5/adapter/ހ;->̍:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, p2, v0, v3, v4}, Lcom/good321/sjh5/adapter/̵;->̍(Landroid/view/View;Lcom/good321/sjh5/adapter/̴;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "B5D2B6C3B5FDBCFDA9C9ABC1BAC6BAC3BED4B5D1B6C0B5F8BCFCA9F9ABC6"

    invoke-static {v0}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :sswitch_b
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x1e966ed5 -> :sswitch_4
        0xcd1f173 -> :sswitch_a
        0x179518e2 -> :sswitch_2
        0x1ea443ba -> :sswitch_b
        0x3472bdfe -> :sswitch_0
        0x4f2c86d5 -> :sswitch_1
        0x6f1e0843 -> :sswitch_5
        0x7bd3f979 -> :sswitch_3
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        -0x5dcf7733 -> :sswitch_7
        -0x40509884 -> :sswitch_9
        0x15d6029b -> :sswitch_6
        0x6e663a60 -> :sswitch_8
    .end sparse-switch
.end method
