import torch.optim as optim

# 设置：调整图片大小以匹配模型的 Linear 层输入 (例如 resize 为 64x64)
transform = transforms.Compose([transforms.Resize((64, 64)), transforms.ToTensor()])
dataset = ActionDataset("dataset", transform=transform)
dataloader = DataLoader(dataset, batch_size=4, shuffle=True)

model = ActionLearner()
criterion = nn.MSELoss() # 均方误差，适合回归坐标
optimizer = optim.Adam(model.parameters(), lr=0.001)

# 开始训练
for epoch in range(100): # 训练 100 轮
    for images, coords in dataloader:
        optimizer.zero_grad()
        outputs = model(images)
        loss = criterion(outputs, coords)
        loss.backward()
        optimizer.step()
    print(f"Epoch {epoch} loss: {loss.item()}")

# 保存模型
torch.save(model.state_dict(), "action_model.pth")