import torch
from torch import nn
from torch.nn import functional as F
from  torch import optim
import torchvision
from torchvision import datasets,transforms
import numpy as np
from scipy import io
from numpy import *
from matplotlib import pyplot as pyplot

from utils import plot_image, plot_curve, one_hot

import dd2
from dd2 import ddNet

import os

os.environ["CUDA_VISIBLE_DEVICES"] = "0"


batch_size = 512

# step1. load dataset
train_loader = torch.utils.data.DataLoader(
    datasets.FashionMNIST('./Fashion_MNIST', train=True, download=True,
                               transform=torchvision.transforms.Compose([
                                   torchvision.transforms.ToTensor(),
                                   torchvision.transforms.Normalize(
                                       (.5,), (.5,))
                               ])),
    batch_size=batch_size, shuffle=True)

test_loader = torch.utils.data.DataLoader(
    datasets.FashionMNIST('./Fashion_MNIST/', train=False, download=True,
                               transform=torchvision.transforms.Compose([
                                   torchvision.transforms.ToTensor(),
                                   torchvision.transforms.Normalize(
                                       (.5,), (.5,))
                               ])),
    batch_size=batch_size, shuffle=False)

x, y = next(iter(train_loader))
print(x.shape, y.shape, x.min(), x.max())
plot_image(x, y, 'image sample')

sta_train_loss = []
sta_acc =[]

for cp in range(1):
 # 循环执行，记录统计数据
    net = ddNet().cuda()
    # [w1, b1, w2, b2, w3, b3]
    optimizer = optim.SGD(net.parameters(), lr=0.05, momentum=0.9)

    train_loss = []
    acc = []

    for epoch in range(300):

        for batch_idx, (x, y) in enumerate(train_loader):

            y_onehot = one_hot(y)
            x, y_onehot = x.cuda(), y_onehot.cuda()

            # x: [b, 1, 28, 28], y: [512]
            # [b, 1, 28, 28] => [b, 784]
            x = x.view(x.size(0), 28*28)
            # => [b, 10]
            out = net(x)
            
            # loss = mse(out, y_onehot)
            loss = F.mse_loss(out, y_onehot)

            optimizer.zero_grad()
            loss.backward()
            # w' = w - lr*grad
            optimizer.step()

            train_loss.append(loss.item())

          #  if batch_idx % 10==0:
          #      print(epoch, batch_idx, loss.item())

        with torch.no_grad():
            total_correct = 0
            num = 0
            for x,y in test_loader:
                x, y = x.cuda(), y.cuda()
                x  = x.view(x.size(0), 28*28)
                # x_np = x.cpu().numpy()
                # np.save('data/input_%s.npy'%(num),x_np )
                # np.savetxt('data/input_%s.txt'%(num),x_np, delimiter='\n' )
                out = net(x)
                # out_np = out.cpu().numpy()
                # np.save('data/output_%s.npy'%(num),out_np )
                # np.savetxt('data/output_%s.txt'%(num),out_np, delimiter='\n' )
                # num = num+1
                # out: [b, 10] => pred: [b]
                pred = out.argmax(dim=1)
                correct = pred.eq(y).sum().float().item()
                total_correct += correct

            total_num = len(test_loader.dataset)
            acc.append(total_correct / total_num)
            
            print('test acc:', acc[-1])

    plot_curve(train_loss)
    plot_curve(acc)

    sta_train_loss.append(train_loss)
    sta_acc.append(acc)

    # save
    io.savemat('DN2c.mat', {'sta_train_loss': sta_train_loss, 'sta_acc': sta_acc})
    
PATH='DD2_12.3_2.pth'
torch.save(net.state_dict(),PATH)


    