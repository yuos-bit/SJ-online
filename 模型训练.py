import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
from torchvision import models, transforms
from PIL import Image
import os
import traceback

# 1. 模型定义 (使用你刚才的结构)
class ActionLearner(nn.Module):
    def __init__(self):
        super().__init__()
        self.backbone = models.mobilenet_v3_small(weights=models.MobileNet_V3_Small_Weights.DEFAULT)
        for param in self.backbone.parameters():
            param.requires_grad = False
        
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

# 2. 数据集加载类
class ActionDataset(Dataset):
    def __init__(self, data_dir, transform=None):
        self.data_dir = data_dir
        self.transform = transform
        self.data = []
        with open(os.path.join(data_dir, "log.txt"), "r", encoding='utf-8') as f:
            for line in f:
                parts = line.strip().split(" | ")
                if len(parts) == 3:
                    self.data.append(parts)

    def __len__(self): return len(self.data)

    def __getitem__(self, idx):
        img_name, x, y = self.data[idx]
        img_path = os.path.join(self.data_dir, img_name)
        image = Image.open(img_path).convert('RGB')
        if self.transform: image = self.transform(image)
        # 返回归一化坐标 (假设窗口大小，也可不归一化直接预测)
        return image, torch.tensor([float(x), float(y)], dtype=torch.float32)

# 3. 主训练流程
def train():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    data_dir = os.path.join(script_dir, "dataset")
    
    # 图像预处理 (MobileNet 标准输入)
    transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])
    
    dataset = ActionDataset(data_dir, transform=transform)
    dataloader = DataLoader(dataset, batch_size=8, shuffle=True)
    
    model = ActionLearner()
    optimizer = optim.Adam(model.regressor.parameters(), lr=0.001)
    criterion = nn.MSELoss()
    
    print("开始训练，请确保 dataset 中有图片和 log.txt...")
    for epoch in range(50):
        total_loss = 0
        for images, coords in dataloader:
            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, coords)
            loss.backward()
            optimizer.step()
            total_loss += loss.item()
        print(f"Epoch {epoch+1}, Loss: {total_loss/len(dataloader):.4f}")
    
    torch.save(model.state_dict(), "action_model.pth")
    print("训练完成，模型已保存为 action_model.pth")

if __name__ == "__main__":
    try:
        train()
    except Exception:
        traceback.print_exc()
        input("按回车退出...")