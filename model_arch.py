import torch.nn as nn
from torchvision import models

class ActionLearner(nn.Module):
    def __init__(self):
        super().__init__()
        self.backbone = models.mobilenet_v3_small(weights=None) # 推理时不需要下载权重
        num_features = self.backbone.classifier[0].in_features
        self.backbone.classifier = nn.Identity()
        self.regressor = nn.Sequential(
            nn.Linear(num_features, 128),
            nn.ReLU(),
            nn.Linear(128, 2)
        )
    def forward(self, x):
        x = self.backbone(x)
        return self.regressor(x)