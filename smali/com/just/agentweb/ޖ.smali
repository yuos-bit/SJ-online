.class public Lcom/just/agentweb/ޖ;
.super Lcom/just/agentweb/ކ;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/just/agentweb/AgentWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field private ̅:Lcom/just/agentweb/AgentWebView;


# direct methods
.method private constructor <init>(Lcom/just/agentweb/AgentWebView;)V
    .locals 0

    invoke-direct {p0}, Lcom/just/agentweb/ކ;-><init>()V

    iput-object p1, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    return-void
.end method

.method synthetic constructor <init>(Lcom/just/agentweb/AgentWebView;Lcom/just/agentweb/͏;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/just/agentweb/ޖ;-><init>(Lcom/just/agentweb/AgentWebView;)V

    return-void
.end method


# virtual methods
.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 3

    invoke-static {}, Lcom/just/agentweb/AgentWebView;->access$500()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "011E27123E130808021A4A"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E5000041D1206021754"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E50095B"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "4E50"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$300(Lcom/just/agentweb/AgentWebView;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {p3}, Lcom/just/agentweb/ԯ;->̔(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p3}, Lcom/just/agentweb/ԯ;->̒(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {p2}, Lcom/just/agentweb/ԯ;->̐(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p3

    if-eqz p3, :cond_0

    iget-object p4, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {p4}, Lcom/just/agentweb/AgentWebView;->access$300(Lcom/just/agentweb/AgentWebView;)Ljava/util/Map;

    move-result-object p4

    invoke-interface {p4, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/just/agentweb/ԯ;

    if-eqz p3, :cond_0

    invoke-virtual {p3, p1, p2}, Lcom/just/agentweb/ԯ;->̖(Landroid/webkit/WebView;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p5, p1}, Landroid/webkit/JsPromptResult;->confirm(Ljava/lang/String;)V

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    invoke-super/range {p0 .. p5}, Lcom/just/agentweb/׼;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result p1

    return p1
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 3

    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$300(Lcom/just/agentweb/AgentWebView;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$400(Lcom/just/agentweb/AgentWebView;)V

    invoke-static {}, Lcom/just/agentweb/ֈ;->̒()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/just/agentweb/AgentWebView;->access$500()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "071E07040D152D04040F230E130711134952011E3D1301061500011D330500000602015C00151A311C0E0017171D034D5C4E"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "4250181302415A45"

    invoke-static {v2}, Lobfuse/NPStringFog;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$600(Lcom/just/agentweb/AgentWebView;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$700(Lcom/just/agentweb/AgentWebView;)V

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/just/agentweb/׼;->onProgressChanged(Landroid/webkit/WebView;I)V

    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/just/agentweb/ޖ;->̅:Lcom/just/agentweb/AgentWebView;

    invoke-static {v0}, Lcom/just/agentweb/AgentWebView;->access$800(Lcom/just/agentweb/AgentWebView;)Lcom/just/agentweb/͐;

    move-result-object v0

    invoke-virtual {v0}, Lcom/just/agentweb/͐;->̒()V

    invoke-super {p0, p1, p2}, Lcom/just/agentweb/׼;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method
