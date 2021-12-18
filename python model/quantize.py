# -*- coding: utf-8 -*-
"""
Created on Wed Dec  1 16:57:27 2021

@author: Administrator
"""
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
from torchsummary import summary


PATH='DD2_12.3_2.pth'
model = ddNet()
model.load_state_dict(torch.load(PATH))
# summary(model, input_size=(512,784), batch_size=-1)

quantized_model = torch.quantization.quantize_dynamic(
    model, {nn.Linear}, dtype=torch.qint8                     
)
print(model)
print(quantized_model)
for name in model.state_dict():
    print(name)
fc0_weight = model.state_dict()['fc0.weight'].numpy()
print(fc0_weight)
np.savetxt('fc0_weight.txt',fc0_weight, delimiter='\n')
dd_weight = model.state_dict()['dd.weight'].numpy()
print(dd_weight)
np.savetxt('dd_weight.txt',dd_weight, delimiter='\n')
fc2_weight = model.state_dict()['fc2.weight'].numpy()
print(fc2_weight)
np.savetxt('fc2_weight.txt',fc2_weight, delimiter='\n')
# for name in quantized_model.state_dict():
#     print(name)
# fc0_scale = quantized_model.state_dict()['fc0.scale'].numpy()
# print(fc0_scale)
# # np.savetxt('fc0_scale.txt',fc0_scale, delimiter='\n')
# fc0_zero_point = quantized_model.state_dict()['fc0.zero_point'].numpy()
# print(fc0_zero_point)
# # np.savetxt('fc0_zero_point.txt',fc0_zero_point, delimiter='\n')
# fc0_packed_params_packed_params = quantized_model.state_dict()['fc0._packed_params._packed_params'][0]
# print(fc0_packed_params_packed_params[0][0].numpy())
# np.savetxt('fc0_packed_params_packed_params.txt',fc0_packed_params_packed_params, delimiter='\n')


# dd_scale = quantized_model.state_dict()['dd.scale'].numpy()
# print(dd_scale)
# np.savetxt('dd_scale.txt',dd_scale, delimiter='\n')
# dd_zero_point = quantized_model.state_dict()['dd.zero_point'].numpy()
# print(dd_zero_point)
# np.savetxt('dd_zero_point.txt',dd_zero_point, delimiter='\n')
# dd_packed_params_packed_params = np.array(quantized_model.state_dict()['dd._packed_params._packed_params'])
# print(dd_packed_params_packed_params)
# np.savetxt('dd_packed_params_packed_params.txt',dd_packed_params_packed_params, delimiter='\n')


# fc2_scale = quantized_model.state_dict()['fc2.scale'].numpy()
# print(fc2_scale)
# np.savetxt('fc2_scale.txt',fc2_scale, delimiter='\n')
# fc2_zero_point = quantized_model.state_dict()['fc2.zero_point'].numpy()
# print(fc2_zero_point)
# np.savetxt('fc2_zero_point.txt',fc2_zero_point, delimiter='\n')
# fc2_packed_params_packed_params = np.array(quantized_model.state_dict()['fc2._packed_params._packed_params'])
# print(fc2_packed_params_packed_params)
# np.savetxt('fc2_packed_params_packed_params.txt',fc2_packed_params_packed_params, delimiter='\n')

